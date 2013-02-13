cmd_usr/initramfs_data.o := arm-eabi-gcc -Wp,-MD,usr/.initramfs_data.o.d  -nostdinc -isystem /home/saram/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/saram/pantech_kernel_msm7630-common/arch/arm/include -Iinclude  -I/home/saram/pantech_kernel_msm7630-common/include -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian   -I/home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -gdwarf-2  -c -o usr/initramfs_data.o /home/saram/pantech_kernel_msm7630-common/usr/initramfs_data.S

deps_usr/initramfs_data.o := \
  /home/saram/pantech_kernel_msm7630-common/usr/initramfs_data.S \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \

usr/initramfs_data.o: $(deps_usr/initramfs_data.o)

$(deps_usr/initramfs_data.o):
