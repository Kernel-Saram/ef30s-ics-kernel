/* Copyright (c) 2009, Code Aurora Forum. All rights reserved.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 and
 * only version 2 as published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301, USA.
 *
 */

#ifndef MT9P111_H
#define MT9P111_H

#include <linux/types.h>
#include <mach/camera.h>

#define CONFIG_PANTECH_CAMERA_MT9P111_OTP

#define MT9P111_MODULE_ABNORMAL_OPERATION_DEFENCE
#ifdef MT9P111_MODULE_ABNORMAL_OPERATION_DEFENCE
#define MT9P111_REG_POLLING_ERROR 3
#endif


#if 1//(BOARD_VER >= EF13_ES21)
#define MT9P111_CFG_BRIGHT_MAX_PARAMS 			2
#define MT9P111_CFG_WB_MAX_PARAMS 				15//12//10
#define MT9P111_CFG_EFFECT_MAX_PARAMS 			9//7
#define MT9P111_CFG_EXPOSURE_MAX_PARAMS 		8//6
#define MT9P111_CFG_PREVIEW_FPS_MAX_PARAMS 	7//5
#define MT9P111_CFG_FLICKER_MAX_PARAMS 		15//17//15//13
#define MT9P111_CFG_ANTISHAKE_MAX_PARAMS 		14//12
#define MT9P111_CFG_FOCUS_STEP_MAX_PARAMS 		7//6
#define MT9P111_CFG_AUTOFOCUS_TRIGGER_MAX_PARAMS 	10//9//19
#define MT9P111_CFG_SCENE_MODE_MAX_PARAMS 		68//57//82//80
#define MT9P111_CFG_REFLECT_MAX_PARAMS 			9//7
#else
#define BRIGHTNESS_STEP_8
#define MT9P111_CFG_BRIGHT_MAX_PARAMS 			2 // 6
#define MT9P111_CFG_WB_MAX_PARAMS 				10
#define MT9P111_CFG_EFFECT_MAX_PARAMS 			7
#define MT9P111_CFG_EXPOSURE_MAX_PARAMS 		9
#define MT9P111_CFG_PREVIEW_FPS_MAX_PARAMS 	5
#define MT9P111_CFG_FLICKER_MAX_PARAMS 		5
#define MT9P111_CFG_ANTISHAKE_MAX_PARAMS 		12
#define MT9P111_CFG_FOCUS_STEP_MAX_PARAMS 		5
#define MT9P111_CFG_AUTOFOCUS_TRIGGER_MAX_PARAMS 		19
#define MT9P111_CFG_SCENE_MODE_MAX_PARAMS 		80
#define MT9P111_CFG_REFLECT_MAX_PARAMS 		6
#endif


extern struct mt9p111_reg mt9p111_regs;

enum mt9p111_width {
	WORD_LEN,
	TRIPLE_LEN,
	BYTE_LEN,	
	ZERO_LEN,
	BURST_WORD_START,
	BURST_WORD_END,
#ifdef CONFIG_PANTECH_CAMERA_MT9P111_OTP
	OTP_MODULE_ZONE_DETECT_START,
	OTP_MODULE_ZONE_DETECT_END,
#if 0	
	OTP_MODULE_ZONE_SET_START,
	OTP_MODULE_ZONE_SET_END,	
#endif	
#endif	
	POLL_MCU_VAR, //polling을 빠져나오는 조건이 정해준 값과 같을 경우
	POLL_MCU_VAR_BYTE, // 1 Byte polling
	POLL_MCU_VAR_NOT // polling을 빠져나오는 조건이 정해준 값과 같지 않을 경우 100818_psj
};

struct mt9p111_i2c_reg_conf {
	unsigned short waddr;
	unsigned short wdata;
	enum mt9p111_width width;
	unsigned short mdelay_time;
};

struct mt9p111_reg {
	const struct mt9p111_i2c_reg_conf *init_settings;
	uint16_t init_settings_size;

	/*const*/ unsigned char *init_patch_burst_settings;
	uint16_t 	init_patch_burst_settings_size;

	const struct mt9p111_i2c_reg_conf *preview_cfg_settings;
	uint16_t preview_cfg_settings_size;
	const struct mt9p111_i2c_reg_conf *snapshot_cfg_settings;
	uint16_t snapshot_cfg_settings_size;
	
//effect
	const struct mt9p111_i2c_reg_conf (*effect_cfg_settings)[MT9P111_CFG_EFFECT_MAX_PARAMS];
	uint16_t effect_cfg_settings_size;

//wb	
	const struct mt9p111_i2c_reg_conf (*wb_cfg_settings)[MT9P111_CFG_WB_MAX_PARAMS];
	uint16_t wb_cfg_settings_size;

//brightness	
	const struct mt9p111_i2c_reg_conf (*bright_cfg_settings)[MT9P111_CFG_BRIGHT_MAX_PARAMS];
	uint16_t bright_cfg_settings_size;
	
//exposure	
	const struct mt9p111_i2c_reg_conf (*exposure_cfg_settings)[MT9P111_CFG_EXPOSURE_MAX_PARAMS];
	uint16_t exposure_cfg_settings_size;

//preview frame rate	
	const struct mt9p111_i2c_reg_conf (*preview_fps_cfg_settings)[MT9P111_CFG_PREVIEW_FPS_MAX_PARAMS];
	uint16_t preview_fps_cfg_settings_size;	

//flicker
	const struct mt9p111_i2c_reg_conf (*flicker_cfg_settings)[MT9P111_CFG_FLICKER_MAX_PARAMS];
	uint16_t flicker_cfg_settings_size;

//antishake
	const struct mt9p111_i2c_reg_conf (*antishake_cfg_settings)[MT9P111_CFG_ANTISHAKE_MAX_PARAMS];
	uint16_t antishake_cfg_settings_size;

//manual foucs
	const struct mt9p111_i2c_reg_conf (*focus_step_cfg_settings)[MT9P111_CFG_FOCUS_STEP_MAX_PARAMS];
	uint16_t focus_step_cfg_settings_size;

//autofocus
	const struct mt9p111_i2c_reg_conf *autofocus_trigger_cfg_settings;
	uint16_t autofocus_trigger_cfg_settings_size;

        const struct mt9p111_i2c_reg_conf *autofocus_rect_cfg_settings;
	uint16_t autofocus_rect_cfg_settings_size;
 
//scene mode
	const struct mt9p111_i2c_reg_conf (*scene_mode_cfg_settings)[MT9P111_CFG_SCENE_MODE_MAX_PARAMS];
	uint16_t scene_mode_cfg_settings_size;

	const struct mt9p111_i2c_reg_conf (*reflect_cfg_settings)[MT9P111_CFG_REFLECT_MAX_PARAMS];
	uint16_t reflect_cfg_settings_size;

#ifdef F_SKYCAM_FIX_CFG_CAF
	const struct mt9p111_i2c_reg_conf * caf_cfg_settings;
	uint16_t caf_cfg_setting_size;

	const struct mt9p111_i2c_reg_conf * fastmode_cfg_settings;
	uint16_t fastmode_cfg_setting_size;
#endif	
};

#endif /* MT9P111_H */
