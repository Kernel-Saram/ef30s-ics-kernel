cmd_mm/vmstat.o := arm-eabi-gcc -Wp,-MD,mm/.vmstat.o.d  -nostdinc -isystem /home/saram/arm-eabi-4.4.3/bin/../lib/gcc/arm-eabi/4.4.3/include -I/home/saram/pantech_kernel_msm7630-common/arch/arm/include -Iinclude  -I/home/saram/pantech_kernel_msm7630-common/include -include include/generated/autoconf.h  -I/home/saram/pantech_kernel_msm7630-common/mm -Imm -D__KERNEL__ -mlittle-endian   -I/home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -Werror -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -DFEATURE_AARM_RELEASE_MODE -DT_EF30S -include /home/saram/pantech_kernel_msm7630-common/include/CUST_PANTECH.h -DFIRM_VER=\"S000000\" -DSYS_MODEL_NAME=\"EF30S\" -DPANTECH_MODEL_NAME=\"IM-A730S\" -D__KERNELBUILD__ -Os -marm -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -Wframe-larger-than=1024 -fno-stack-protector -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack   -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(vmstat)"  -D"KBUILD_MODNAME=KBUILD_STR(vmstat)" -D"DEBUG_HASH=30" -D"DEBUG_HASH2=8" -c -o mm/vmstat.o /home/saram/pantech_kernel_msm7630-common/mm/vmstat.c

deps_mm/vmstat.o := \
  /home/saram/pantech_kernel_msm7630-common/mm/vmstat.c \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/hotplug.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/debug/fs.h) \
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
  /home/saram/pantech_kernel_msm7630-common/include/linux/mm.h \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/ksm.h) \
    $(wildcard include/config/arch/populates/node/map.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/gfp.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/debug/vm.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/cgroup/mem/res/ctlr.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/nodemask.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/generated/bounds.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/glue.h \
    $(wildcard include/config/cpu/arm610.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/cpu/abrt/lv4t.h) \
    $(wildcard include/config/cpu/abrt/ev4.h) \
    $(wildcard include/config/cpu/abrt/ev4t.h) \
    $(wildcard include/config/cpu/abrt/ev5tj.h) \
    $(wildcard include/config/cpu/abrt/ev5t.h) \
    $(wildcard include/config/cpu/abrt/ev6.h) \
    $(wildcard include/config/cpu/abrt/ev7.h) \
    $(wildcard include/config/cpu/pabrt/legacy.h) \
    $(wildcard include/config/cpu/pabrt/v6.h) \
    $(wildcard include/config/cpu/pabrt/v7.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/memory.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/const.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/memory.h \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/arch/msm7x30.h) \
    $(wildcard include/config/vmsplit/3g.h) \
    $(wildcard include/config/arch/msm/arm11.h) \
    $(wildcard include/config/cache/l2x0.h) \
    $(wildcard include/config/arch/msm/scorpion.h) \
    $(wildcard include/config/arch/msm/scorpionmp.h) \
    $(wildcard include/config/arch/msm7x27.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/sizes.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/memory_model.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/getorder.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/memory_hotplug.h \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/memory/hotremove.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/notifier.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/srcu.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/sparsemem.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/topology.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/topology.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/mmdebug.h \
    $(wildcard include/config/debug/virtual.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rbtree.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/want/page/debug/flags.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mm/owner.h) \
    $(wildcard include/config/mmu/notifier.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/auxvec.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/auxvec.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/page-debug-flags.h \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/page/debug/something/else.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/range.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/4level-fixup.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/proc-fns.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/cpu/v7.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/cpu-single.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/vmalloc.h \
    $(wildcard include/config/vmsplit/2g.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/pgtable-hwdef.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/tlbflush.h \
    $(wildcard include/config/cpu/tlb/v3.h) \
    $(wildcard include/config/cpu/tlb/v4wt.h) \
    $(wildcard include/config/cpu/tlb/fa.h) \
    $(wildcard include/config/cpu/tlb/v4wbi.h) \
    $(wildcard include/config/cpu/tlb/feroceon.h) \
    $(wildcard include/config/cpu/tlb/v4wb.h) \
    $(wildcard include/config/cpu/tlb/v6.h) \
    $(wildcard include/config/cpu/tlb/v7.h) \
    $(wildcard include/config/arm/errata/720789.h) \
    $(wildcard include/config/arch/msm8x60.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/detect/softlockup.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/cgroup/sched.h) \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/timex.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/param.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/timex.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/mach-msm/include/mach/timex.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/jiffies.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/cputime.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/cputime.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/sem.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/ipc.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/ipcbuf.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/sembuf.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/signal.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/signal.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/signal-defs.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/sigcontext.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/siginfo.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/siginfo.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/proportions.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/resource.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/resource.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/resource.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/latencytop.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/key.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/sysctl.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/aio.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/aio_abi.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/uio.h \
  /home/saram/pantech_kernel_msm7630-common/include/asm-generic/pgtable.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/s390.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/vmstat.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/module.h \
    $(wildcard include/config/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/kmod.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/elf.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/elf-em.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/elf.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/user.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ppc64.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/tracepoint.h \
  /home/saram/pantech_kernel_msm7630-common/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
  /home/saram/pantech_kernel_msm7630-common/include/trace/events/module.h \
  /home/saram/pantech_kernel_msm7630-common/include/trace/define_trace.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/debug/slab.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/slab_def.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/kmemtrace.h \
    $(wildcard include/config/kmemtrace.h) \
  /home/saram/pantech_kernel_msm7630-common/include/trace/events/kmem.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/kmalloc_sizes.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/cpu.h \
    $(wildcard include/config/arch/cpu/probe/release.h) \
    $(wildcard include/config/pm/sleep/smp.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/sysdev.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/pm.h \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/pm/runtime.h) \
    $(wildcard include/config/pm/ops.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/node.h \
    $(wildcard include/config/hugetlbfs.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/proc_fs.h \
    $(wildcard include/config/proc/devicetree.h) \
    $(wildcard include/config/proc/kcore.h) \
  /home/saram/pantech_kernel_msm7630-common/include/linux/magic.h \
  /home/saram/pantech_kernel_msm7630-common/include/linux/seq_file.h \

mm/vmstat.o: $(deps_mm/vmstat.o)

$(deps_mm/vmstat.o):
