cmd_kernel/power/built-in.o :=  arm-eabi-ld -EL    -r -o kernel/power/built-in.o kernel/power/main.o kernel/power/console.o kernel/power/process.o kernel/power/suspend.o kernel/power/nvs.o kernel/power/wakelock.o kernel/power/userwakelock.o kernel/power/earlysuspend.o kernel/power/consoleearlysuspend.o kernel/power/poweroff.o 
