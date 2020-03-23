# BrokenPitv0
BrokenPit is a primary exploit for the __"Nintendo DSi Camera"__!<br>
This exploit's PoC will demonstrate a change of color splash screens from the touch screen.

## Exploit/Vulnerability Detail:
> Buffer overflow via unchecked header size<br>
> The Camera app loads the pit.bin file from the SD card to load images. However, the header size at offset 0x16 is unchecked, so a big enough header size value can exceed boundaries and cause the buffer to overwrite and jump to unsigned code.

## Requirements:
* Any Nintendo DSi/3DS System on any System Firmware.
* Regions supported: USA, EUR, and JPN (Unsure about other regions).
* An SD Card (Any size).

## Installation:
1. Download the __"BrokenPitv0.zip"__ archive from the latest release and read the instructions from the `instructions.txt" file.

## Triggering the BrokenPit Exploit:
1. Tap the `SD Card` option on the top right of your touch screen.
2. Tap `Album`.

## FAQ:
1. Q: What's the purpose of this exploit?
	- __A:__ To run simple unsigned custom code from the DSi Camera App and to understand the process of [shutterbug2000's MemoryPit](https://gbatemp.net/threads/memory-pit-a-new-dsi-exploit-for-dsi-camera.539432/).
2. Q: My DSi crashes when I attempt to trigger the exploit. 
	- __A:__ You most likely have a different version of the DSi Camera Application which affect the addresses to run a payload. You can try [shutterbug2000's MemoryPit](https://gbatemp.net/threads/memory-pit-a-new-dsi-exploit-for-dsi-camera.539432/) or [zoogie's edition](https://dsi.cfw.guide/installing-unlaunch) to launch into the [NDS-HBMenu](https://github.com/devkitPro/nds-hb-menu/releases/).
5. Q: How do I uninstall this exploit?
	- __A:__ Delete the `pit.bin` file from your SD Card that's located at `private/ds/app/484E494A`.

## Special Thanks:
* [zoogie](https://github.com/zoogie): Assisting me to locate and calculate the WRAM Address for the pointers
* [shutterbug2000](https://github.com/shutterbug2000): Originally Exploited the DSi Camera System Applet ([MemoryPit](https://gbatemp.net/threads/memory-pit-a-new-dsi-exploit-for-dsi-camera.539432/))
* [DSiBrew.org](https://dsibrew.org): Documentation of the `pit.bin` file. (https://dsibrew.org/wiki/Private/ds/app/484E94*/pit.bin)