cmd_kernel/power/poweroff.o := arm-eabi-gcc -Wp,-MD,kernel/power/.poweroff.o.d  -nostdinc -isystem /home/saram/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/saram/pantech_kernel_msm7630-common/arch/arm/include -Iinclude  -I/home/saram/pantech_kernel_msm7630-common/include -include include/generated/autoconf.h  -I/home/saram/pantech_kernel_msm7630-common/kernel/power -Ikernel/power -D__KERNEL__ -mlittle-endian   -I/home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -Werror -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -DFEATURE_AARM_RELEASE_MODE -DT_EF30S -include /home/saram/pantech_kernel_msm7630-common/include/CUST_PANTECH.h -DFIRM_VER=\"S000000\" -DSYS_MODEL_NAME=\"EF30S\" -DPANTECH_MODEL_NAME=\"IM-A730S\" -D__KERNELBUILD__ -Os -marm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack   -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(poweroff)"  -D"KBUILD_MODNAME=KBUILD_STR(poweroff)" -D"DEBUG_HASH=10" -D"DEBUG_HASH2=41" -c -o kernel/power/poweroff.o /home/saram/pantech_kernel_msm7630-common/kernel/power/poweroff.c

deps_kernel/power/poweroff.o := \
  /home/saram/pantech_kernel_msm7630-common/kernel/power/poweroff.c \
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
  /home/saram/pantech_kernel_msm7630-common/include/linux/kernel.h \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/saram/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include/stdarg.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/linkage.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/compiler-gcc4.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/linkage.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/stddef.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/types.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/int-ll64.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/bitsperlong.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitsperlong.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/posix_types.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/posix_types.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/bitops.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/bitops.h \
    $(wildcard include/config/smp.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/32v6k.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/typecheck.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/irqflags.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/hwcap.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/cmpxchg-local.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/non-atomic.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/fls64.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/sched.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/hweight.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/arch_hweight.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/const_hweight.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/lock.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/dynamic_debug.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/byteorder.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/byteorder/little_endian.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/swab.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/swab.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/byteorder/generic.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/div64.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/sysrq.h \
    $(wildcard include/config/magic/sysrq.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/errno.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/errno.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/errno.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/errno-base.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/pm.h \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/pm/runtime.h) \
    $(wildcard include/config/pm/ops.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/prefetch.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/processor.h \
    $(wildcard include/config/mmu.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/workqueue.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/debug/objects/work.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/seqlock.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/domain.h \
    $(wildcard include/config/verify/permission/fault.h) \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/emulate/domain/manager/v7.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/stringify.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/bottom_half.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/spinlock_types.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/spinlock_types_up.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/lockdep.h \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/generic/hardirqs.h) \
    $(wildcard include/config/prove/rcu.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rwlock_types.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/spinlock_up.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rwlock.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/spinlock_api_up.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/atomic-long.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/math64.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/jiffies.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/timex.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/param.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/timex.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/timex.h \
    $(wildcard include/config/arch/msm/scorpionmp.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/wait.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/current.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/completion.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/reboot.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/notifier.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/rwsem.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/srcu.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/emergency-restart.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/emergency-restart.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/bitmap.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/string.h \

kernel/power/poweroff.o: $(deps_kernel/power/poweroff.o)

$(deps_kernel/power/poweroff.o):
