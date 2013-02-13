cmd_arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.o := arm-eabi-gcc -Wp,-MD,arch/arm/oprofile/../../../drivers/oprofile/.oprofile_files.o.d  -nostdinc -isystem /home/saram/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/saram/pantech_kernel_msm7630-common/arch/arm/include -Iinclude  -I/home/saram/pantech_kernel_msm7630-common/include -include include/generated/autoconf.h  -I/home/saram/pantech_kernel_msm7630-common/arch/arm/oprofile -Iarch/arm/oprofile -D__KERNEL__ -mlittle-endian   -I/home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -Werror -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -DFEATURE_AARM_RELEASE_MODE -DT_EF30S -include /home/saram/pantech_kernel_msm7630-common/include/CUST_PANTECH.h -DFIRM_VER=\"S000000\" -DSYS_MODEL_NAME=\"EF30S\" -DPANTECH_MODEL_NAME=\"IM-A730S\" -D__KERNELBUILD__ -Os -marm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack  -DMODULE -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(oprofile_files)"  -D"KBUILD_MODNAME=KBUILD_STR(oprofile)" -D"DEBUG_HASH=63" -D"DEBUG_HASH2=56" -c -o arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.o /home/saram/pantech_kernel_msm7630-common/arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.c

deps_arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.o := \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.c \
    $(wildcard include/config/oprofile/event/multiplex.h) \
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
  /home/saram/pantech_kernel_msm7630-common/include/linux/fs.h \
    $(wildcard include/config/dnotify.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/inotify.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/limits.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/ioctl.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/ioctl.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/ioctl.h \
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
  /home/saram/pantech_kernel_msm7630-common/include/linux/wait.h \
    $(wildcard include/config/lockdep.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/stddef.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/prefetch.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/types.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/int-ll64.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/bitsperlong.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitsperlong.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/posix_types.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/posix_types.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/processor.h \
    $(wildcard include/config/mmu.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/hwcap.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
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
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/cmpxchg-local.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/bitops.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/bitops.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/non-atomic.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/fls64.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/sched.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/hweight.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/arch_hweight.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/const_hweight.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/bitops/lock.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/domain.h \
    $(wildcard include/config/verify/permission/fault.h) \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/emulate/domain/manager/v7.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/kernel.h \
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
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/current.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/kdev_t.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/dcache.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rculist.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/bitmap.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/string.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/seqlock.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/completion.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rcutree.h \
    $(wildcard include/config/no/hz.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/path.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/stat.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/stat.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/math64.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/kobject.h \
    $(wildcard include/config/hotplug.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/sysfs.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/errno.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/errno.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/errno.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/errno-base.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/kref.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/radix-tree.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/prio_tree.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/init.h \
    $(wildcard include/config/modules.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/pid.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/capability.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/semaphore.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/fiemap.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/rwsem.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/percpu_counter.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/pfn.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/percpu.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/percpu.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/dqblk_xfs.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/dqblk_v1.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/dqblk_v2.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/dqblk_qtree.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/nfs_fs_i.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/nfs.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/sunrpc/msg_prot.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/inet.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/fcntl.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/fcntl.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/fcntl.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/err.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/oprofile.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/jiffies.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/timex.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/param.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/timex.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/timex.h \
    $(wildcard include/config/arch/msm/scorpionmp.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/oprofile/../../../drivers/oprofile/event_buffer.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/mutex.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/oprofile/../../../drivers/oprofile/oprofile_stats.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/oprofile/../../../drivers/oprofile/oprof.h \

arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.o: $(deps_arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.o)

$(deps_arch/arm/oprofile/../../../drivers/oprofile/oprofile_files.o):
