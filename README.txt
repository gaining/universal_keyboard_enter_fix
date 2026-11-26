Universal Keyboard Enter Fix — Magisk module

At installation, scans /vendor/usr/keylayout/*.kl. For each file with an
active `key 28 DPAD_CENTER` mapping, copies it into the Magisk overlay and
changes only that mapping to `key 28 ENTER`.

This covers vendor key layouts using that mapping, including generic and
device-specific layouts. It may also change the behavior of TV remotes or
other HID devices whose keycode 28 is intended as DPAD_CENTER.

It does not modify layouts under /system, /odm, or /product.

Installation:
1. Disable/remove the previous "USB Keyboard Enter Fix" module in Magisk.
2. Install this ZIP from storage.
3. Reboot.

Rollback: disable/remove this module in Magisk and reboot.
