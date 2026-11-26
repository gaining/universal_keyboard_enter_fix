# Universal Keyboard Enter Fix

A Magisk module for Android set-top boxes and Android TVs that makes the **Enter** key on keyboards work properly. It also works on other Android devices.

## What it does

At installation, the module scans `/vendor/usr/keylayout/*.kl`. For each file with an active `key 28 DPAD_CENTER` mapping, it copies the file into the Magisk overlay and changes only that mapping to:

```
key 28 ENTER
```

This covers vendor key layouts that use that mapping, including both generic and device-specific layouts.

## Scope

| Path | Modified? |
|------|-----------|
| `/vendor/usr/keylayout/*.kl` | Yes (only files with an active `key 28 DPAD_CENTER` mapping) |
| `/system` | No |
| `/odm` | No |
| `/product` | No |

Nothing is written to the real partitions. Changes live in the Magisk overlay, so removing the module restores the original behavior.

## ⚠️ Caveat

Because the change is made to key code 28, it may also change the behavior of **TV remotes or other HID devices** whose key code 28 is intended to act as `DPAD_CENTER`. If your remote's OK/select button stops working after installing, remove the module.

## Requirements

- Android device with [Magisk](https://github.com/topjohnwu/Magisk) installed
- Root access

## Installation

1. Disable or remove the previous **"USB Keyboard Enter Fix"** module in Magisk, if installed.
2. Download the module ZIP.
3. In Magisk, go to **Modules → Install from storage** and select the ZIP.
4. Reboot.

## Uninstallation

Remove the module in Magisk and reboot.

## Repository structure

```
.
├── customize.sh
├── META-INF/com/google/android/
│   ├── update-binary
│   └── updater-script
├── module.prop
└── README.md
```

To build a flashable ZIP, zip the **contents** of the repository (not the folder itself) so that `module.prop` sits at the root of the archive.
