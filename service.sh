#!/system/bin/sh
echo 1 > /sys/block/zram0/reset
echo $(awk '/MemTotal/{print $2}' /proc/meminfo)KB > /sys/block/zram0/disksize

if [ ! -e /dev/zram0 ]; then
    mknod /dev/zram0 b $(cat /sys/block/zram0/dev | tr ":" " ")
fi

# https://github.com/VR-25/zram-swap-manager/blob/master/zram-swap-manager.sh
mkswap() {
    for exec in /data/adb/vr25/bin/mkswap /*/*bin/mkswap /sbin/mkswap mkswap; do
        if [ -x $exec ] || which $exec >/dev/null; then
            eval $exec "$@" && break || echo "(i) Trying alternative: $exec..."
        fi
    done
}

swapon() {
    for exec in /data/adb/vr25/bin/swapon /*/*bin/swapon /sbin/swapon swapon; do
        if [ -x $exec ] || which $exec >/dev/null; then
            eval $exec "$@" && break || echo "(i) Trying alternative: $exec..."
        fi
    done
}

mkswap /dev/zram0
swapon /dev/zram0
write /proc/sys/vm/swappiness 100
