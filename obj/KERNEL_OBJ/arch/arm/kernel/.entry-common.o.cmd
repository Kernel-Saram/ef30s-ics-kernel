cmd_arch/arm/kernel/entry-common.o := arm-eabi-gcc -Wp,-MD,arch/arm/kernel/.entry-common.o.d  -nostdinc -isystem /home/saram/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/saram/pantech_kernel_msm7630-common/arch/arm/include -Iinclude  -I/home/saram/pantech_kernel_msm7630-common/include -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian   -I/home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -gdwarf-2  -c -o arch/arm/kernel/entry-common.o /home/saram/pantech_kernel_msm7630-common/arch/arm/kernel/entry-common.S

deps_arch/arm/kernel/entry-common.o := \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/kernel/entry-common.S \
    $(wildcard include/config/function/tracer.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/oabi/compat.h) \
    $(wildcard include/config/arm/thumb.h) \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/aeabi.h) \
    $(wildcard include/config/alignment/trap.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/unistd.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/ftrace.h \
    $(wildcard include/config/frame/pointer.h) \
    $(wildcard include/config/arm/unwind.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/entry-macro.S \
    $(wildcard include/config/msm/vic.h) \
    $(wildcard include/config/arm/gic.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/entry-macro-vic.S \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/msm_iomap.h \
    $(wildcard include/config/arch/msm7x30.h) \
    $(wildcard include/config/arch/qsd8x50.h) \
    $(wildcard include/config/arch/msm8x60.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/sizes.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/msm_iomap-7x30.h \
    $(wildcard include/config/msm/debug/uart.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/unwind.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/kernel/entry-header.S \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/linkage.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/linkage.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/smp.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/ptrace.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/hwcap.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/errno.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/errno.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/errno-base.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/kernel/calls.S \

arch/arm/kernel/entry-common.o: $(deps_arch/arm/kernel/entry-common.o)

$(deps_arch/arm/kernel/entry-common.o):
