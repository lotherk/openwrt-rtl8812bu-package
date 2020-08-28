# rtl88x2bu package for Openwrt
This was an attempt to get the driver for a USB3 Wifi adapter based on the rtl8812bu chipset. It loads but hangs when one attempts to bring it up as an AP at least after crosscompiling for a Mediatek mt7623 processor. 

This was created using the rtl8812au-ct package as a guide. 

disclaimer: I have no idea what I'm doing. Use at your own risk.

## Usage
This is an OpenWRT package. Place this project's files in your Openwrt source directory under `package/kernel/rtl88x2bu/` and run `make menuconfig` to include it in your build.
