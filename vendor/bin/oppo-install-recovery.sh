#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fcb43d3f8a9dfe55bdf7a915c2719e3e045279f5; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:bef64955198e02551d9366ffde0d523876fe75a7 \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:67108864:fcb43d3f8a9dfe55bdf7a915c2719e3e045279f5 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
