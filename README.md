# Simple Android ZRAM

A simple Magisk module that creates a 4GB ZRAM swap on Android devices.

This module specifically handles the situation where the device node `/dev/zram0` isn't automatically created, as seen on my Amazon Fire HD 8 (7th gen) with LineageOS 12.1.

# How to use

1. Run `make` to create the module zip file.
2. Copy zip file to Android device and install with Magisk manager.

# License

GPLv3.
