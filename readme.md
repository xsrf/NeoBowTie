# NeoBowTie

<img src="res/pcb_back.svg">

## Features
- Bowtie style PCB
- 17 NeoPixel RGB LEDs (SK6812) facing through the PCB
- Powered by rechargeable LiPo Battery (420mAh)
- Charged via MicroUSB (2h to full charge)
- Custom programming via MicroUSB
- Based on ATTiny85 microcontroller
- Mode/Animation selection via Button

## Operation

A **short press** on the MODE button cycles the available modes. When you **hold down** the MODE button, the current animations slows down or changes its style each time the center LED flashes.

When powered up, it briefly shows a battery indication with green and red LEDs. But since a 3.3V LDO is used, it will only start showing red LEDs once the battery voltage drops below 3.3V. All red means 2.7V and the device will turn off to protect the battery.

The **first mode after power-up** can be used to adjust the brightness. **hold down** the MODE button to gradually lower the brightness in 16 steps.

## Getting started (programming)

### Installing VSCode and PlatformIO
Install [VSCode](https://code.visualstudio.com/) and open the downloaded/cloned [project folder](https://github.com/xsrf/NeoTree/archive/refs/heads/master.zip) in VScode.
VSCode should ask you to install the PlatformIO extension - do so.
You may need to close VSCode and open the folder once again in VSCode for PlatformIO to recognize the project.
Open `src/main.c` and look for "Build", "Upload", "Home" buttons on the bottom bar of VSCode.

### Installing Zadig (Windows)
Download Zadig from [here](https://zadig.akeo.ie/) or [github releases](https://github.com/pbatard/libwdi/releases). 
Zadig is used to install the required USB driver. See the [documentation](https://github.com/pbatard/libwdi/wiki/Zadig) for more details and screenshots.
Assign the `libusb-win32` driver (not `winusb`).

To do so, the NeoBowTie needs to be pre-flashed with the USB bootloader (it is if you got it from me, otherwise see *usb-bootloader* subfolder), turned off, connected via MicroUSB cable and then turned on. It should appear in Zadig. Select "Options - List All Devices" if it doesn't. Select `libusb-win32` and click install.

### Compile and upload code
Open the project folder in VSCode and open `src/main.c`. Make sure to select `env:usb` in the bottom bar of VSCode as PlatformIO environment.
Connect the NeoBowTie via USB but keep it turned off.
Then hit upload ("->" Button) and follow the console output.
When it says `Please plug in the device (will time out in 60 seconds) ...` turn on the NeoBowTie. It should immediately upload the new code.
Avoid using USB-Hubs if you have problems with USB detecting the device.