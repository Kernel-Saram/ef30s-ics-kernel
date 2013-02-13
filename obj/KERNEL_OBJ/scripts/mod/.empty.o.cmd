cmd_scripts/mod/empty.o := arm-eabi-gcc -Wp,-MD,scripts/mod/.empty.o.d  -nostdinc -isystem /home/saram/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/saram/pantech_kernel_msm7630-common/arch/arm/include -Iinclude  -I/home/saram/pantech_kernel_msm7630-common/include -include include/generated/autoconf.h  -I/home/saram/pantech_kernel_msm7630-common/scripts/mod -Iscripts/mod -D__KERNEL__ -mlittle-endian   -I/home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -Werror -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -DFEATURE_AARM_RELEASE_MODE -DT_EF30S -include /home/saram/pantech_kernel_msm7630-common/include/CUST_PANTECH.h -DFIRM_VER=\"S000000\" -DSYS_MODEL_NAME=\"EF30S\" -DPANTECH_MODEL_NAME=\"IM-A730S\" -D__KERNELBUILD__ -Os -marm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack   -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(empty)"  -D"KBUILD_MODNAME=KBUILD_STR(empty)" -D"DEBUG_HASH=43" -D"DEBUG_HASH2=50" -c -o scripts/mod/empty.o /home/saram/pantech_kernel_msm7630-common/scripts/mod/empty.c

deps_scripts/mod/empty.o := \
  /home/saram/pantech_kernel_msm7630-common/scripts/mod/empty.c \
  /home/saram/pantech_kernel_msm7630-common/include/CUST_PANTECH.h \
    $(wildcard include/config/.h) \
    $(wildcard include/config/pantech/pmic.h) \
    $(wildcard include/config/pantech/bt.h) \
    $(wildcard include/config/sky/bt.h) \
    $(wildcard include/config/pantech/ef36s/3pole/headset.h) \
    $(wildcard include/config/pantech/ef36s/1mic.h) \
    $(wildcard include/config/pantech/ef36s/devide/add.h) \
    $(wildcard include/config/pantech/ef36s/asr/path.h) \
    $(wildcard include/config/pantech/err/crash/logging.h) \
    $(wildcard include/config/pantech/sky/factory/command.h) \
    $(wildcard include/config/usb/android/pantech/qc/bug/fix.h) \
    $(wildcard include/config/pantech/sky.h) \
    $(wildcard include/config/pantech/wifi/broadcom/bcm4329.h) \
    $(wildcard include/config/hsusb/pantech/usb/test.h) \
  /home/saram/pantech_kernel_msm7630-common/include/BOARD_REV.h \
  /home/saram/pantech_kernel_msm7630-common/include/CUST_PANTECH_SURFACEFLINGER.h \
    $(wildcard include/config/sky/fb/24bpp/rgb888.h) \
  /home/saram/pantech_kernel_msm7630-common/include/CUST_PANTECH_CAMERA.h \
    $(wildcard include/config/msm/camera/debug.h) \
    $(wildcard include/config/skycam/mt9p111.h) \
    $(wildcard include/config/skycam/yacbac1sddas.h) \
    $(wildcard include/config/mt9p111.h) \
  /home/saram/pantech_kernel_msm7630-common/include/cust_sky_ds_linux.h \
    $(wildcard include/config/bug/fix.h) \
    $(wildcard include/config/uid/stat.h) \
  /home/saram/pantech_kernel_msm7630-common/include/cust_pantech_mmp.h \

scripts/mod/empty.o: $(deps_scripts/mod/empty.o)

$(deps_scripts/mod/empty.o):
