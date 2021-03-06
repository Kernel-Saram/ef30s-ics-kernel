
/*******************************************************************************
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License version 2 as
* published by the Free Software Foundation.
*
* THE PRESENT SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES
* OR CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, FOR THE SOLE
* PURPOSE TO SUPPORT YOUR APPLICATION DEVELOPMENT.
* AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY DIRECT,
* INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING FROM THE
* CONTENT OF SUCH SOFTWARE AND/OR THE USE MADE BY CUSTOMERS OF THE CODING
* INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
*
* THIS SOFTWARE IS SPECIFICALLY DESIGNED FOR EXCLUSIVE USE WITH ST PARTS.
*
*******************************************************************************/

#include <linux/module.h>
#include <linux/init.h>
#include <linux/slab.h>
#include <linux/i2c.h>
#include <linux/mutex.h>
#include <linux/delay.h>
#include <mach/vreg.h>
#include <linux/gpio.h>
#include <linux/delay.h>
#include "l3g4200d.h"

#define L3G4200D_DRV_NAME	"gyroscope"
#define DRIVER_VERSION		"1.0.0"

/* -------------------------------------------------------------------- */
/* debug option */
/* -------------------------------------------------------------------- */
//#define SENSOR_L3G4200D_DBG_SELFENABLE //self test log
//#define SENSOR_L3G4200D_DBG_ENABLE
#ifdef SENSOR_L3G4200D_DBG_SELFENABLE
#define dbgs(fmt, args...)   printk("[L3G4200D] " fmt, ##args)
#else
#define dbgs(fmt, args...)
#endif
#ifdef SENSOR_L3G4200D_DBG_ENABLE
#define dbg(fmt, args...)   printk("[L3G4200D] " fmt, ##args)
#else
#define dbg(fmt, args...)
#endif
#define dbg_func_in()       dbgs("[FUNC_IN] %s\n", __func__)
#define dbg_func_out()      dbgs("[FUNC_OUT] %s\n", __func__)
#define dbg_line()          dbgs("[LINE] %d(%s)\n", __LINE__, __func__)
/* -------------------------------------------------------------------- */

/* -------------------------------------------------------------------- */
/* SKY BOARD FEATURE */
/* -------------------------------------------------------------------- */

/* -------------------------------------------------------------------- */
/* L3G4200D REGISTER */
/* -------------------------------------------------------------------- */
#define REG_WHO_AM_I    0x0F
#define VAL_WHO_AM_I    0xD3
#define REG_CTRL_BASE		0x20
#define REG_CTRL(n)			(REG_CTRL_BASE+n-1)
#define REG_DATA    		0x28
/* -------------------------------------------------------------------- */
/* ds2 team : self test */
/* -------------------------------------------------------------------- */
#define REG_STATS    		0x27 //PS2 TEAM SHS : self test filed
#define REG_TEMP    		0x26 //PS2 TEAM SHS : self test filed
#define SELF_HALF	5 //ps2 team shs : self test max count
#define SELF_MAX			(SELF_HALF*2)
#define SELF_ZYXDA	0x8 //ps2 team shs : check status
#define MIN_2000dps		175 //ps2 team shs : gyroscope self min data
#define MAX_2000dps		875 //ps2 team shs : gyroscope self max data
#define Sensitivity		70 //fs=2000dps
#define DPS_1000				1000


/* -------------------------------------------------------------------- */
/* Structure and Type */
/* -------------------------------------------------------------------- */
typedef enum {
	E_UNAVAILABLE = 0,
	E_AVAILABLE = 1,
} available_e;

typedef enum {
	E_POWER_OFF = 0x00,
	E_POWER_ON = 0x0F,
} power_e;

typedef enum {
	E_SCALE_250DPS = 0x00,
	E_SCALE_500DPS = 0x10,
	E_SCALE_2000DPS = 0x30,
	E_SCALE_2000DPS_BDU = 0xa0,	//SHS : TEMP CODE
} scale_e;

typedef enum {
	E_BW100_CO12p5	= 0x00,
	E_BW100_CO25p0	= 0x10,
	E_BW200_CO12p5	= 0x40,
	E_BW200_CO25p0	= 0x50,
	E_BW200_CO50p0	= 0x60,
	E_BW200_CO70p0	= 0x70,
	E_BW400_CO20p0	= 0x80,
	E_BW400_CO25p0	= 0x90,
	E_BW400_CO50p0	= 0xA0,
	E_BW400_CO110p0	= 0xB0,
	E_BW800_CO30p0	= 0xC0,
	E_BW800_CO35p0	= 0xD0,
	E_BW800_CO50p0	= 0xE0,
	E_BW800_CO110p0	= 0xF0,
} bandwidth_e;

/* -------------------------------------------------------------------- */
/* ds2 team : self test */
/* -------------------------------------------------------------------- */
typedef enum {
	E_FAILED = 0,
	E_WAIT=1,
	E_SUCCESS = 2,
} selfresult_e;

typedef enum {
	NORMALMODE = 0x00,
	SELFMODE= 0x01,
} selfstats_e;
typedef enum adc_data
{
	X_VALUE=0,
	Y_VALUE,
	Z_VALUE,

	NUM_OF_VALUE
}ADC_DATA;

typedef struct{
	  short x;
	  short y;
	  short z;
}axes_self;
typedef struct{
	  int x;
	  int y;
	  int z;
}axes_self32;

typedef struct{
	available_e self_available; //self  test enable / disable filed
	selfresult_e selfresult; //self test result filed
	axes_self self_data[SELF_HALF]; //self test data filed
	axes_self normal_data[SELF_HALF]; //normal data filed	
	axes_self min_data; //min data filed
	axes_self max_data; //max data filed		
	selfstats_e selfstats;
	short gyrodata_average[2][3]; // gyrodata average filed
	int 	self_count;
}selftest_e;


typedef struct {
	struct i2c_client	*client;
	struct mutex		i2clock;
	power_e					power;
	scale_e					scale;
	bandwidth_e			bandwidth;
	available_e			available;
	selftest_e				selftest; //ds2 team shs : self test filed
} l3g4200ddata_t;
/* -------------------------------------------------------------------- */
/* Global variable */
/* -------------------------------------------------------------------- */
static  l3g4200ddata_t l3g4200ddata;

/* -------------------------------------------------------------------- */
/* Function Proto Type */
/* -------------------------------------------------------------------- */
static int l3g4200d_i2c_read(u8 reg, u8 *buf, int count);
static int l3g4200d_i2c_write(u8 reg, u8 *data, int len);
static int l3g4200d_set_vreg(int on);
static int l3g4200d_set_power(power_e pwr);
static int l3g4200d_set_scale(scale_e scale);
static int l3g4200d_set_bandwidth(bandwidth_e bandwidth);
static int l3g4200d_init_reg(void);
static int l3g4200d_init_data(struct i2c_client *client);




/* -------------------------------------------------------------------- */
/* ds2 team : self test */
/* -------------------------------------------------------------------- */
static int l3g4200d_disable_selftest(void);
static int l3g4200d_init_selfreg(void);
static void l3g4200d_selftest_initialize(void);	
static int l3g4200d_set_selftest(void);
static int l3g4200d_measure_selftest(axes_self *val);
static int l3g4200d_result_selftest(void);
static int l3g4200d_selftestresult(void);


static void l3g4200d_selftest_initialize()
{
	int i=0;
	l3g4200ddata.selftest.selfresult=E_WAIT;
	l3g4200ddata.selftest.min_data.x=MIN_2000dps;
	l3g4200ddata.selftest.min_data.y=MIN_2000dps;
	l3g4200ddata.selftest.min_data.z=MIN_2000dps;
	
	l3g4200ddata.selftest.max_data.x=MAX_2000dps;	
	l3g4200ddata.selftest.max_data.y=MAX_2000dps;	
	l3g4200ddata.selftest.max_data.z=MAX_2000dps;		

	l3g4200ddata.selftest.gyrodata_average[NORMALMODE][X_VALUE]= 0;
	l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Y_VALUE]= 0;
	l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Z_VALUE]= 0;
	
	l3g4200ddata.selftest.gyrodata_average[SELFMODE][X_VALUE]= 0;
	l3g4200ddata.selftest.gyrodata_average[SELFMODE][Y_VALUE]= 0;
	l3g4200ddata.selftest.gyrodata_average[SELFMODE][Z_VALUE]= 0;
	
	for(i=0;i<SELF_HALF;i++)
	{
		//initalize self data
		l3g4200ddata.selftest.self_data[i].x=0;
		l3g4200ddata.selftest.self_data[i].y=0;
		l3g4200ddata.selftest.self_data[i].z=0;		
		//initalize normal data
		l3g4200ddata.selftest.normal_data[i].x=0;
		l3g4200ddata.selftest.normal_data[i].y=0;
		l3g4200ddata.selftest.normal_data[i].z=0;
	}
	//initalize stats
	l3g4200ddata.selftest.selfstats=NORMALMODE;

	//initalize index
	l3g4200ddata.selftest.self_count=0;
	

}
static int l3g4200d_disable_selftest()
{
	int ret;
	u8 data;

	dbg_func_in();

	// 1. config 0x20
	data=0x00;
	ret = l3g4200d_i2c_write(REG_CTRL(1), &data, 1);
	if(ret) return ret;
	// 2. config 0x23
	ret = l3g4200d_i2c_write(REG_CTRL(4), &data, 1);
	if(ret) return ret;
	dbg_func_out();
	
	return 0;

}
	
//ds2 team shs : self test initialize function
static int l3g4200d_init_selfreg()
{
	int ret;
	u8 data;

	dbg_func_in();

	//0. initialize self test
	l3g4200d_selftest_initialize();
	// 1. config 0x20
	data=0x6f;
	ret = l3g4200d_i2c_write(REG_CTRL(1), &data, 1);
	if(ret) return ret;

	// 2. config 0x21
	data=0x00;
	ret = l3g4200d_i2c_write(REG_CTRL(2), &data, 1);
	if(ret) return ret;

	// 3. config 0x22
	data=0x00;
	ret = l3g4200d_i2c_write(REG_CTRL(3), &data, 1);
	if(ret) return ret;

	// 4. config 0x23
	data=0xa0;
	ret = l3g4200d_i2c_write(REG_CTRL(4), &data, 1);
	if(ret) return ret;

	// 5. config 0x24
	data=0x02;
	ret = l3g4200d_i2c_write(REG_CTRL(5), &data, 1);
	if(ret) return ret;
	msleep(800);
	
	dbg_func_out();
	
	return 0;
}


static int l3g4200d_set_selftest()
{
	int ret;
	u8 data;

	dbg_func_in();
	// 4. config 0x23
	data=0xa2;
	ret = l3g4200d_i2c_write(REG_CTRL(4), &data, 1);
	if(ret) return ret;
	//delay time setting
	mdelay(100);	
	dbg_func_out();
	
	return 0;
}
static int l3g4200d_measure_selftest(axes_self *val)
{
	int index=l3g4200ddata.selftest.self_count;
	//end self test 

	dbgs("L3G4200D  [INDEX[%d]] : [a_data.x => [%d]] [a_data.y => [%d]] [a_data.z => [%d]]\n",index,val->x,val->y,val->z);					
	dbgs("@@L3G4200D  [INDEX[%d]] : [a_data.x => [%x]] [a_data.y => [%x]] [a_data.z => [%x]]\n",index,val->x,val->y,val->z);						
	if(index!=(SELF_MAX))
	{
		//check self stats 
		if(l3g4200ddata.selftest.selfstats==NORMALMODE)
			{
				l3g4200ddata.selftest.normal_data[index].x=val->x;
				l3g4200ddata.selftest.normal_data[index].y=val->y;
				l3g4200ddata.selftest.normal_data[index].z=val->z;
			}
		else
			{
				index=l3g4200ddata.selftest.self_count-SELF_HALF;
				l3g4200ddata.selftest.self_data[index].x=val->x;
				l3g4200ddata.selftest.self_data[index].y=val->y;
				l3g4200ddata.selftest.self_data[index].z=val->z;
			}
	//add self test index
	l3g4200ddata.selftest.self_count++;

	//change mode
	if(l3g4200ddata.selftest.self_count==SELF_HALF)
	l3g4200ddata.selftest.selfstats=SELFMODE;
		
	}
	return 0;
}

static int l3g4200d_result_selftest()
{
	int aflag=E_SUCCESS;
	int i=0;
	axes_self amin;
	axes_self amax;
	axes_self32 a_data_normal;
	axes_self32 a_data_self;
	short u16Delta_X=0, u16Delta_Y=0, u16Delta_Z=0;
	int u32Delta_X=0, u32Delta_Y=0, u32Delta_Z=0;	
	
	a_data_self.x=0;
	a_data_self.y=0;
	a_data_self.z=0;
	a_data_normal.x=0;
	a_data_normal.y=0;
	a_data_normal.z=0;
	
	amin.x=l3g4200ddata.selftest.min_data.x;
	dbgs("1. l3g4200d_result_selftest amin.x => [%d]\n",amin.x);			
	amin.y=l3g4200ddata.selftest.min_data.y;
	dbgs("2. l3g4200d_result_selftest amin.y => [%d]\n",amin.y);				
	amin.z=l3g4200ddata.selftest.min_data.z;
	dbgs("3. l3g4200d_result_selftest amin.z => [%d]\n",amin.z);				
	amax.x=l3g4200ddata.selftest.max_data.x;
	dbgs("4. l3g4200d_result_selftest amax.x => [%d]\n",amax.x);				
	amax.y=l3g4200ddata.selftest.max_data.y;	
	dbgs("5. l3g4200d_result_selftest amax.y => [%d]\n",amax.y);				
	amax.z=l3g4200ddata.selftest.max_data.z;
	dbgs("6. l3g4200d_result_selftest amax.z => [%d]\n",amax.z);			
	for(i=0;i<SELF_HALF;i++)
	{
		a_data_self.x+=l3g4200ddata.selftest.self_data[i].x;
		a_data_self.y+=l3g4200ddata.selftest.self_data[i].y;
		a_data_self.z+=l3g4200ddata.selftest.self_data[i].z;	
		a_data_normal.x+=l3g4200ddata.selftest.normal_data[i].x;
		a_data_normal.y+=l3g4200ddata.selftest.normal_data[i].y;		
		a_data_normal.z+=l3g4200ddata.selftest.normal_data[i].z;				
	}
	dbgs("7.ST [a_data.x => [%d]] [a_data.y => [%d]] [a_data.z => [%d]]\n",a_data_self.x,a_data_self.y,a_data_self.z);					
	dbgs("8.NOST [a_data.x => [%d]] [a_data.y => [%d]] [a_data.z => [%d]]\n",a_data_normal.x,a_data_normal.y,a_data_normal.z);						
	l3g4200ddata.selftest.gyrodata_average[NORMALMODE][X_VALUE]= ((a_data_normal.x)/SELF_HALF);
	l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Y_VALUE]= ((a_data_normal.y)/SELF_HALF);
	l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Z_VALUE]= ((a_data_normal.z)/SELF_HALF);
	dbgs("9.NOST / 5 [a_data.x => [%d]] [a_data.y => [%d]] [a_data.z => [%d]]\n",l3g4200ddata.selftest.gyrodata_average[NORMALMODE][X_VALUE],l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Y_VALUE],l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Z_VALUE]);							
	dbgs("9.NOST / 5 [a_data.x => [%x]] [a_data.y => [%x]] [a_data.z => [%x]]\n",l3g4200ddata.selftest.gyrodata_average[NORMALMODE][X_VALUE],l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Y_VALUE],l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Z_VALUE]);								
	l3g4200ddata.selftest.gyrodata_average[SELFMODE][X_VALUE]= ((a_data_self.x)/SELF_HALF);
	l3g4200ddata.selftest.gyrodata_average[SELFMODE][Y_VALUE]= ((a_data_self.y)/SELF_HALF);
	l3g4200ddata.selftest.gyrodata_average[SELFMODE][Z_VALUE]= ((a_data_self.z)/SELF_HALF);
	dbgs("10.ST / 5 [a_data.x => [%d]] [a_data.y => [%d]] [a_data.z => [%d]]\n",l3g4200ddata.selftest.gyrodata_average[SELFMODE][X_VALUE],l3g4200ddata.selftest.gyrodata_average[SELFMODE][Y_VALUE],l3g4200ddata.selftest.gyrodata_average[SELFMODE][Z_VALUE]);							
	dbgs("10.ST / 5 [a_data.x => [%x]] [a_data.y => [%x]] [a_data.z => [%x]]\n",l3g4200ddata.selftest.gyrodata_average[SELFMODE][X_VALUE],l3g4200ddata.selftest.gyrodata_average[SELFMODE][Y_VALUE],l3g4200ddata.selftest.gyrodata_average[SELFMODE][Z_VALUE]);								
	u16Delta_X= abs(l3g4200ddata.selftest.gyrodata_average[SELFMODE][X_VALUE])-abs(l3g4200ddata.selftest.gyrodata_average[NORMALMODE][X_VALUE]);
	dbgs("11-0.u8Delta_X [%d]]\n",u16Delta_X);							
	u32Delta_X=(u16Delta_X
*Sensitivity)/DPS_1000;	
	dbgs("11-1.u32Delta_X [%d]]\n",u32Delta_X);								
	if ( (u32Delta_X < amin.x ) ||  (u32Delta_X> amax.x) )
	{
		aflag= E_FAILED;
	}	
	u16Delta_Y= abs(l3g4200ddata.selftest.gyrodata_average[SELFMODE][Y_VALUE])-abs(l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Y_VALUE]);
	dbgs("12-0.u8Delta_Y [%d]]\n",u16Delta_Y);										
	u32Delta_Y=(u16Delta_Y
*Sensitivity)/DPS_1000;		
	dbgs("12-1.u32Delta_Y [%d]]\n",u32Delta_Y);									
	if ( (u32Delta_Y< amin.y) || (u32Delta_Y> amax.y) )
	{
		aflag= E_FAILED;
	}
	u16Delta_Z= abs(l3g4200ddata.selftest.gyrodata_average[SELFMODE][Z_VALUE])-abs(l3g4200ddata.selftest.gyrodata_average[NORMALMODE][Z_VALUE]);
	dbgs("13-0.u8Delta_Z [%d]]\n",u16Delta_Z);										
	u32Delta_Z=(u16Delta_Z
*Sensitivity)/DPS_1000;			
	dbgs("13-1.u8Delta_Z [%d]]\n",u32Delta_Z);									
	if ( (u32Delta_Z< amin.z)	|| (u32Delta_Z> amax.z ) )
	{
		aflag= E_FAILED;
	}	
	
	return aflag;
}
static int l3g4200d_selftestresult()
{
	u8 data[6] = {0,0,0,0,0,0};
	int err;
	int aflag=0; //ps2 team shs : self test flag
	u8 status;
	int index=20; //ps2 team shs : try 20 time 
	axes_self val;
	while(index)
	{

		l3g4200d_i2c_read(REG_STATS, &status, 1);		
		dbgs("1. l3g4200d_selftestresult status => [%x]\n",status);		
		if(status&SELF_ZYXDA)
		{
			/*
			l3g4200d_i2c_read(REG_DATA, &data[0], 1);
			l3g4200d_i2c_read(REG_DATA+1, &data[1], 1);
			l3g4200d_i2c_read(REG_DATA+2, &data[2], 1);
			l3g4200d_i2c_read(REG_DATA+3, &data[3], 1);
			l3g4200d_i2c_read(REG_DATA+4, &data[4], 1);
			err = l3g4200d_i2c_read(REG_DATA+5, &data[5], 1);
			*/
			err = l3g4200d_i2c_read(REG_DATA|0x80, data, 6);

			if(err) {
				//i2c error fatal
				val.x = 0;
				val.y = 0;
				val.z = 0;
				index--;				
				continue;	
			}

			val.x = (data[1]<<8);
			val.x|= (data[0]&0xFF);
			val.y = (data[3]<<8);
			val.y|= (data[2]&0xFF);
			val.z = (data[5]<<8);
			val.z|= (data[4]&0xFF);
			
			
			l3g4200d_measure_selftest(&val);
			//change 0x23 register : enable self mode
			if((l3g4200ddata.selftest.self_count==SELF_HALF) && (l3g4200ddata.selftest.selfstats==SELFMODE))
			l3g4200d_set_selftest();
		}
		//end test mode
		if(l3g4200ddata.selftest.self_count==SELF_MAX) 
		break;
		index--;
		msleep(10); //read delay
	}
	
	aflag=l3g4200d_result_selftest();
	//disable self test mode
	l3g4200d_disable_selftest();
	return aflag;

}

/* -------------------------------------------------------------------- */
/* External Functions */
/* -------------------------------------------------------------------- */
int l3g4200d_control_enable(int enable)
{
	int ret = 0;

	dbg_func_in();
	dbg("enable = %d / available = %d\n", enable, l3g4200ddata.available);
	
	if ( l3g4200ddata.available == E_UNAVAILABLE ) {
		printk("%s : l3g4200ddata is unavailable\n", __func__);
		return -1;
	}

	if (enable) {
		if( l3g4200d_set_power(E_POWER_ON))
			ret = -1;
		else
			ret = l3g4200d_init_reg();
	}
	else {
		ret = l3g4200d_set_power(E_POWER_OFF);
	}

	dbg("l3g4200ddata.available = %d\n",	l3g4200ddata.available);
	dbg("l3g4200ddata.power = %d\n",		l3g4200ddata.power);
	dbg("l3g4200ddata.scale = %d\n",		l3g4200ddata.scale);
	dbg("l3g4200ddata.bandwidth = %d\n",		l3g4200ddata.bandwidth);
	dbg("l3g4200ddata.available = %d\n",	l3g4200ddata.available);

	dbg_func_out();

	return ret;
}

int l3g4200d_measure(axes_t *val)
{
	u8 data[6] = {0,0,0,0,0,0};
	u8 atemperature =0;
	int err;
	short x, y,z;


	//err = l3g4200d_i2c_read(REG_DATA, &data[0], 6);

	//read temperature 
	l3g4200d_i2c_read(REG_TEMP, &atemperature, 1);
	dbgs("l3g4200d_measure temperature : [%d]\n", atemperature);	

	/*
	//read data
	l3g4200d_i2c_read(REG_DATA, &data[0], 1);
	l3g4200d_i2c_read(REG_DATA+1, &data[1], 1);
	l3g4200d_i2c_read(REG_DATA+2, &data[2], 1);
	l3g4200d_i2c_read(REG_DATA+3, &data[3], 1);
	l3g4200d_i2c_read(REG_DATA+4, &data[4], 1);
	err = l3g4200d_i2c_read(REG_DATA+5, &data[5], 1);
	*/
	err = l3g4200d_i2c_read(REG_DATA|0x80, data, 6);

	if(err) {
		val->x = 0;
		val->y = 0;
		val->z = 0;
		return err;	
	}

	x = (data[1]<<8) | data[0];
	y = (data[3]<<8) | data[2];
	z =  (data[5]<<8) | data[4];

	dbgs("original l3g4200d_measure : (%d,%d,%d)\n", x, y, z);	
#ifdef CONFIG_EF30S_SENSORS_L3G4200D
	#if 0
	val->x = (y*Sensitivity)/DPS_1000;
	val->y=  (x*Sensitivity)/DPS_1000;	
	val->z = ((-1)*z*Sensitivity)/DPS_1000;
	#else
	val->x = (y*Sensitivity)/DPS_1000;
	val->y=  (x*Sensitivity)/DPS_1000;	
	val->z = ((-1)*z*Sensitivity)/DPS_1000;
	#endif
#else
	val->x = (x*Sensitivity)/DPS_1000;
	val->y=  (y*Sensitivity)/DPS_1000;	
	val->z = (z*Sensitivity)/DPS_1000;
#endif
	dbgs("final l3g4200d_measure : (%d,%d,%d)\n", val->x, val->y, val->z);

	return 0;
}

/* -------------------------------------------------------------------- */

/* -------------------------------------------------------------------- */
/* Internal Functions */
/* -------------------------------------------------------------------- */

/* ------------- System Attribute ---------------*/

// Attribute : power
static ssize_t l3g4200d_show_powermode(struct device *dev, struct device_attribute *attr, char *buf)
{
	if ( l3g4200ddata.client == NULL ) {
		printk("%s : l3g4200ddata.client is NULL\n", __func__);
		return 0;
	}
	return sprintf(buf, "%d\n", l3g4200ddata.power);
}

static ssize_t l3g4200d_store_powermode(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
{
	int err;
	u8 powermode = (u8)simple_strtoul(buf, NULL, 10);

	dbg("%s : power = %d\n", __func__, powermode);
	err = l3g4200d_set_power(powermode);
	if(err) return 0;

	return count;
}

// Attribute : scale
static ssize_t l3g4200d_show_scale(struct device *dev, struct device_attribute *attr, char *buf)
{
	if ( l3g4200ddata.client == NULL ) {
		printk("%s : l3g4200ddata.client is NULL\n", __func__);
		return 0;
	}
	return sprintf(buf, "%d\n", l3g4200ddata.scale);
}

static ssize_t l3g4200d_store_scale(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
{
	int err;
	u8 scale = (u8)simple_strtoul(buf, NULL, 10);

	dbg("%s : scale = %d\n", __func__, scale);
	err = l3g4200d_set_scale(scale);
	if(err) return 0;

	return count;
}

// Attribute : bandwidth
static ssize_t l3g4200d_show_bandwidth(struct device *dev, struct device_attribute *attr, char *buf)
{
	if ( l3g4200ddata.client == NULL ) {
		printk("%s : l3g4200ddata.client is NULL\n", __func__);
		return 0;
	}
	return sprintf(buf, "%d\n", l3g4200ddata.bandwidth);
}

static ssize_t l3g4200d_store_bandwidth(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
{
	int err;
	u8 bandwidth = (u8)simple_strtoul(buf, NULL, 10);

	dbg("%s : bandwidth = %d\n", __func__, bandwidth);
	err = l3g4200d_set_bandwidth(bandwidth);
	if(err) return 0;

	return count;
}

//ps2 team shs : add self test filed
static ssize_t l3g4200d_show_selftest(struct device *dev, struct device_attribute *attr, char *buf)
{
	if ( l3g4200ddata.client == NULL ) {
		printk("%s : l3g4200ddata.client is NULL\n", __func__);
		return 0;
	}
	return sprintf(buf, "%d\n", l3g4200ddata.selftest.self_available);
}

static ssize_t l3g4200d_store_selftest(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
{
	u8 scale = (u8)simple_strtoul(buf, NULL, 10);
	dbgs("calling l3g4200d_store_selftest scale => [%d]\n",scale);
	l3g4200ddata.selftest.self_available=scale;
	if(l3g4200ddata.selftest.self_available==E_AVAILABLE)
		{
		// step1. setting register
		l3g4200d_init_selfreg();
		// step2. do selftest
		l3g4200ddata.selftest.selfresult=l3g4200d_selftestresult();		
		}
	return count;
}


static ssize_t l3g4200d_show_selftestresult(struct device *dev, struct device_attribute *attr, char *buf)
{
	if ( l3g4200ddata.client == NULL ) {
		printk("%s : l3g4200ddata.client is NULL\n", __func__);
		return 0;
	}
	return sprintf(buf, "%d\n", l3g4200ddata.selftest.selfresult);
}

static ssize_t l3g4200d_show_sensorresult(struct device *dev, struct device_attribute *attr, char *buf)
{
	u8 id=0;
	int ret = 0;
	int flag =0;
	// 2. get chip-id and compare (== 0x01)
	ret = l3g4200d_i2c_read(REG_WHO_AM_I, &id, 1);
	if( (ret == 0))
	flag=1;
	else
	flag=0;
	return sprintf(buf, "%d\n", flag);	
}


static DEVICE_ATTR(powermode, S_IWUSR | S_IRUGO, l3g4200d_show_powermode, l3g4200d_store_powermode);
static DEVICE_ATTR(scale, S_IWUSR | S_IRUGO, l3g4200d_show_scale, l3g4200d_store_scale);
static DEVICE_ATTR(bandwidth, S_IWUSR | S_IRUGO, l3g4200d_show_bandwidth, l3g4200d_store_bandwidth);

//ps2 team shs : add self test filed
static DEVICE_ATTR(selftest, S_IWUSR | S_IRUGO, l3g4200d_show_selftest, l3g4200d_store_selftest);
static DEVICE_ATTR(selftestresult, S_IWUSR | S_IRUGO, l3g4200d_show_selftestresult, NULL);
static DEVICE_ATTR(sensorresult, S_IWUSR | S_IRUGO, l3g4200d_show_sensorresult, NULL);

static struct attribute *l3g4200d_attrs[] = {
	&dev_attr_powermode.attr,
	&dev_attr_scale.attr,
	&dev_attr_bandwidth.attr,
	&dev_attr_selftest.attr, //ps2 team shs : add self test filed
	&dev_attr_selftestresult.attr, //ps2 tema shs : add self test filed
	&dev_attr_sensorresult.attr, //ps2 tema shs : add self test filed	
	NULL,
};

static struct attribute_group l3g4200d_attr_group = {
	.attrs = l3g4200d_attrs,
};
/* -------------------------------------------------------------------- */

/* ------------- I2C Interface ---------------*/
static int l3g4200d_i2c_read(u8 reg, u8 *buf, int count)
{
	int rc1, rc2;
	int ret = 0; 
	#ifdef SENSOR_L3G4200D_DBG_ENABLE
	int i;
	#endif

	if ( l3g4200ddata.client == NULL ) {
		printk("%s : l3g4200ddata.client is NULL\n", __func__);
		return -ENODEV;
	}

	buf[0] = reg;
	
	mutex_lock(&l3g4200ddata.i2clock); 
	rc1 = i2c_master_send(l3g4200ddata.client,  buf, 1);

	rc2 = i2c_master_recv(l3g4200ddata.client, buf, count);
	mutex_unlock(&l3g4200ddata.i2clock);

	#ifdef SENSOR_L3G4200D_DBG_ENABLE
	dbg("%s REG[0x%02X] :", __FUNCTION__, reg);
	for(i=0; i<count; i++) printk(" 0x%02X", buf[i]);
	printk("\n");
	#endif

	if ( (rc1 != 1) || (rc2 != count ) ) {
		dev_err(&l3g4200ddata.client->dev, "l3g4200d_i2c_read FAILED: read of register %d\n", reg);
		ret = -1;
	}

	return ret;
}

static int l3g4200d_i2c_write(u8 reg, u8 *data, int len)
{
	u8  buf[20];
	int rc;
	int ret = 0;
	int i; 
	#ifdef SENSOR_L3G4200D_DBG_ENABLE
	u8 rbuf[20];
	#endif

	if ( l3g4200ddata.client == NULL ) {
		printk("%s : l3g4200ddata.client is NULL\n", __func__);
		return -ENODEV;
	}
	
	buf[0] = reg;
	if (len >= 20) {
		dev_err(&l3g4200ddata.client->dev, "l3g4200d_i2c_write FAILED: buffer size is limitted(20)\n");
		return -1;
	}
	for( i=0 ; i<len; i++ ) buf[i+1] = data[i];

	mutex_lock(&l3g4200ddata.i2clock);  
	rc = i2c_master_send(l3g4200ddata.client, buf, len+1);
	mutex_unlock(&l3g4200ddata.i2clock);

	#ifdef SENSOR_L3G4200D_DBG_ENABLE
	dbg("%s REG[0x%02X] :", __FUNCTION__, reg);
	for(i=0; i<len+1; i++) dbg(" 0x%02X", buf[i]);
	dbg("\n");
	dbg("WRITECHECK\n");
	l3g4200d_i2c_read(reg, &rbuf[0], len);
	#endif

	if (rc != len+1) {
		dev_err(&l3g4200ddata.client->dev, "l3g4200d_i2c_write FAILED: writing to reg %d\n", reg);
		ret = -1;
	}

	return ret;
}

/* ------------- set vreg ---------------*/
static int l3g4200d_set_vreg(int on)
{
	int err;
	struct vreg *vr = vreg_get(NULL, "gp2");
	
	dbg_func_in();
	
//	if(on) {
		err = vreg_set_level(vr, 2600);
		if(!err) err = vreg_enable(vr);
		else return -1;
//	}
//	else {
//		err = vreg_disable(vr);
//		if(err) return -1;
//	}

	dbg_func_out();

	return err;
}

/* ------------- set power ---------------*/
static int l3g4200d_set_power(power_e pwr)
{
	int err;
	u8 val;
	
	dbg_func_in();
	
	err = l3g4200d_i2c_read(REG_CTRL(1), &val, 1);
	if(err) return err;

	val &= 0xF0;
	val |= pwr;
	err = l3g4200d_i2c_write(REG_CTRL(1), &val, 1);
	if(err) return err;
	l3g4200ddata.power = pwr;
	
	dbg("set_power(%s)\n", (pwr==E_POWER_ON) ? "ON" : "OFF");

	dbg_func_out();

	if(pwr==E_POWER_ON)		// 4. wait for power on state [ps2 team shs]
	msleep(800);	

	return err;
}

static int l3g4200d_set_scale(scale_e scale)
{
	int err;
	u8 val;
	
	dbg_func_in();
	
	err = l3g4200d_i2c_read(REG_CTRL(4), &val, 1);
	if(err) return err;

	val &= 0xCF;
	val |= scale;
//	val |= 1; // 101115
	err = l3g4200d_i2c_write(REG_CTRL(4), &val, 1);
	if(err) return err;
	l3g4200ddata.scale = scale;
	
	dbg("set_scale(%s)\n", (scale==E_SCALE_250DPS) ? "250dps" : (scale==E_SCALE_500DPS) ? "500dps" : "2000dps");

	dbg_func_out();

	return err;
}

static int l3g4200d_set_bandwidth(bandwidth_e bw)
{
	int err;
	u8 val;
	
	dbg_func_in();
	
printk("bREG_CTRL(1)=0x%02X\n", REG_CTRL(1));
	err = l3g4200d_i2c_read(REG_CTRL(1), &val, 1);
	if(err) return err;

printk("b(1)val=0x%02X", val);
	val &= 0x0F;
	val |= bw;
printk("b(2)val=0x%02X", val);
	err = l3g4200d_i2c_write(REG_CTRL(1), &val, 1);
	if(err) return err;
	l3g4200ddata.bandwidth = bw;
	
	dbg("set_bandwidth(0x%02X)\n", bw);

	dbg_func_out();

	return err;
}

static int l3g4200d_init_reg(void)
{
	int ret;

	dbg_func_in();

	// 1. config power
	ret = l3g4200d_set_power(E_POWER_ON);
	if(ret<0) return ret;

	
		
	// 2. config scale
	ret = l3g4200d_set_scale(E_SCALE_2000DPS_BDU);
	if(ret<0) return ret;
		
	// 3. config bandwidth
	ret = l3g4200d_set_bandwidth(E_BW100_CO25p0);
	if(ret<0) return ret;

	dbg_func_out();
	
	return 0;
}

static int l3g4200d_init_data(struct i2c_client *client)
{
	int err = 0;
	int ret;	
	int trytime=3;
	u8 id;
	dbg_func_in();

	// 1. assign i2c client
	l3g4200ddata.client = client;
	i2c_set_clientdata(client, &l3g4200ddata);

	// 2. initialize mutex
	mutex_init(&l3g4200ddata.i2clock);

	// 3. check device available
	do
	{
	ret = l3g4200d_i2c_read(REG_WHO_AM_I, &id, 1);
	printk("%s : ret = %d / id = 0x%02X\n", __func__, ret, id);
	if( (ret == 0))
		{
		l3g4200ddata.available = E_AVAILABLE; //delete id code
		break;
		}
	else l3g4200ddata.available = E_UNAVAILABLE; //delete id code
	trytime--;
	}while(trytime);
		
	dbg("%s : l3g4200ddata.available = %d\n", __func__, l3g4200ddata.available);

	dbg_func_out();
	
	return err;
}
/* -------------------------------------------------------------------- */



/* -------------------------------------------------------------------- */
/* Driver Functions */
/* -------------------------------------------------------------------- */

static struct i2c_driver l3g4200d_driver;
static int __devinit l3g4200d_probe(struct i2c_client *client, const struct i2c_device_id *id)
{
	struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
	int err = 0;
	
	dbg_func_in();


	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE)) {
		printk("I2C ERROR ERRROR \n");
		err = -EIO;
		return err;
	}

	err = l3g4200d_set_vreg(1);
	if(err) return err;
//	l3g4200d_set_power(E_POWER_ON); ps2 team shs 

	/* Initialize the L3G4200D chip */
	err = l3g4200d_init_data(client);
//	l3g4200d_set_power(E_POWER_OFF); ps2 team shs 

	/* register sysfs */
	err = sysfs_create_group(&client->dev.kobj, &l3g4200d_attr_group);

	dbg_func_out();
	
	return err;
}

static int __devexit l3g4200d_remove(struct i2c_client *client)
{
	int ret;
		
	dbg_func_in();

	ret = l3g4200d_control_enable(0);

	kfree(i2c_get_clientdata(client));

	dbg_func_out();
	
	return 0;
}

#ifdef CONFIG_PM

static int l3g4200d_suspend(struct device *dev)
{
	int err;

	dbg_func_in();

	err = l3g4200d_set_vreg(0);
	dbg("%s : err = %d\n", __FUNCTION__, err);

	dbg_func_out();

	return 0; 
}

static int l3g4200d_resume(struct device *dev)
{
	int err = 0;

	dbg_func_in();

	err = l3g4200d_set_vreg(1);
	dbg("%s : err = %d\n", __FUNCTION__, err);

	dbg_func_out();

	return 0;
}

#else

#define l3g4200d_suspend	NULL
#define l3g4200d_resume		NULL

#endif /* CONFIG_PM */

static const struct i2c_device_id l3g4200d_id[] = {
	{ "l3g4200d", 0 },
	{ }
};
MODULE_DEVICE_TABLE(i2c, l3g4200d_id);

const static struct dev_pm_ops l3g4200d_pm_ops = {
    .suspend = l3g4200d_suspend,
    .resume = l3g4200d_resume,
};

static struct i2c_driver l3g4200d_driver = {
	.driver = {
		.name	= L3G4200D_DRV_NAME,
		.owner	= THIS_MODULE,
		.pm		= &l3g4200d_pm_ops,
	},
//	.suspend = l3g4200d_suspend,
//	.resume	= l3g4200d_resume,
	.probe	= l3g4200d_probe,
	.remove	= __devexit_p(l3g4200d_remove),
	.id_table = l3g4200d_id,
};

static int __init l3g4200d_init(void)
{
	return i2c_add_driver(&l3g4200d_driver);
}

static void __exit l3g4200d_exit(void)
{
	i2c_del_driver(&l3g4200d_driver);
}

MODULE_AUTHOR("Park Seunghwan <park.seunghwan@pantech.com>");
MODULE_DESCRIPTION("L3G4200D gyro sensor driver");
MODULE_LICENSE("GPL");
MODULE_VERSION(DRIVER_VERSION);

module_init(l3g4200d_init);
module_exit(l3g4200d_exit);
