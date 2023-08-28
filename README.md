# sa_yolo_ng

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
https://firebase.google.com/docs/cli#install-cli-mac-linux
-curl -sL https://firebase.tools | bash

Firebase https://firebase.google.com/docs/flutter/setup?platform=web
- firebase login
- dart pub global activate flutterfire_cli
- flutterfire configure

Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path.
You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):

  export PATH="$PATH":"$HOME/.pub-cache/bin"

- flutter pub add firebase_core
- flutterfire configure
- import 'package:firebase_core/firebase_core.dart';
- import 'firebase_options.dart'

Firestore https://firebase.google.com/docs/firestore/quickstart#dart
- flutter pub add cloud_firestore

set chrome in 
/etc/environment/
chrome executable  CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

https://firebase.flutter.dev/docs/firestore/usage#realtime-changes