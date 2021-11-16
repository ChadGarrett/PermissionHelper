# PermissionHelper

This package can be used as unified way of requesting different types of device permissions for an application.

## Features

- Supports Swift 5.3+, XCode 12.5+ and iOS10+.
- Check and request permission for the following device features
    - Calendar
    - Camera
    - Contacts
    - Microphone
    - Music
    - Notifications
    - Photos
    - Reminders
    - Siri

## Missing features (coming soon)

- Individually package each permission as a product to avoid apps being rejected for having too many permission requests
- Safety check that the info.plist contains the relevant permission asks

## Installation

In Xcode, go to  `File` > `Swift Packages` > `Add package dependency` and enter: `https://github.com/ChadGarrett/PermissionHelper.git`.
