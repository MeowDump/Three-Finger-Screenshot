### Screenshots

<p align="center">
  <img src="https://raw.githubusercontent.com/MeowDump/MeowDump/refs/heads/main/Assets/ss1.png" alt="Screenshot 1" width="22%">
  <img src="https://raw.githubusercontent.com/MeowDump/MeowDump/refs/heads/main/Assets/ss2.png" alt="Screenshot 2" width="22%">
  <img src="https://raw.githubusercontent.com/MeowDump/MeowDump/refs/heads/main/Assets/ss3.png" alt="Screenshot 3" width="22%">
  <img src="https://raw.githubusercontent.com/MeowDump/MeowDump/refs/heads/main/Assets/ss4.png" alt="Screenshot 4" width="22%">
  <br><br>
  <img src="https://raw.githubusercontent.com/MeowDump/MeowDump/refs/heads/main/Assets/ss5.png" alt="Screenshot 5" width="22%">
  <img src="https://raw.githubusercontent.com/MeowDump/MeowDump/refs/heads/main/Assets/ss6.gif" alt="Screenshot 6" width="22%">
</p>

### Overview
This Magisk module lets you take screenshots using three-finger tap or swipe gestures on any rooted Android device.
It works by tracking touch input directly, so it doesn’t need Accessibility permissions or screen overlays. This makes it fast, accurate, and easy to use.
#### NOTE: 
Screenshots may not appear in Google Photos app on some ROMs, but they will still be taken and stored in `/sdcard/Pictures/Screenshots` If this happens in your case, kindly use [FOSSIFY GALLERY](https://play.google.com/store/apps/details?id=org.fossify.gallery&hl=en_IN&pli=1)

### Key Features

- **Three-finger gesture** (tap or swipe) instantly captures screenshots
- No hooks, overlays, or accessibility APIs
- Lightweight and runs as a background shell service
- Cooldown period to avoid accidental rapid captures
- Toggle on/off using action/webui
- Screenshots are saved to `/sdcard/Pictures/Screenshots` and indexed by media scanner
- Sends a custom toast notification when a screenshot is captured

## Installation & Usage

1. Download the latest `version` file from the [Releases](https://github.com/MeowDump/Three-Finger-Screenshot/releases) section.
2. Flash the module & reboot your device
3. Click on **action button**

## Gameplay-Friendly Design

It’s obvious that you might use three or more fingers while playing fast-paced games like PUBG, BGMI, or Call of Duty. To prevent accidental screenshots during gameplay, the module includes a feature that lets you completely enable or disable the gesture on demand without needing to reboot your device.

You can toggle the gesture by clicking the _**Action Button**_ Or by using the _**Toggle Gesture Button**_ in the _**WebUI**_
