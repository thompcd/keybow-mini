# Keybow Mini - Custom Layouts

3-key macro pad powered by Pimoroni Keybow Mini + Raspberry Pi Zero 2 W.

## Current Layouts

- **led_colors.lua** — LED color controller (off / red / green)

## Setup

1. Download [Keybow firmware v0.0.4](https://github.com/pimoroni/keybow-firmware/releases/tag/v0.0.4)
2. Format micro-SD as FAT32
3. Copy firmware's `sdcard/` contents to SD card
4. Replace `keys.lua` and `layouts/` with files from this repo
5. Insert SD into Pi Zero 2 W, attach Keybow Mini, plug USB into host
