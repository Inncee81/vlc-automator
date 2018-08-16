#!/bin/bash

pushd vlc-ios
bundle install
pod update
xcodebuild \
  -scheme VLC-iOS \
  -configuration Debug \
  -destination 'platform=iOS Simulator,name=iPhone 6 Plus,OS=11.4' \
  -derivedDataPath \
  build
popd
