#! /bin/bash
# This script assumes that the Android SDK is installed to ~/bin
# 
export PROJ_DIR=`pwd`
export ANDROID_SDK="$HOME/Android/Sdk"
export ANDROID_NDK=$PROJ_DIR/../ndk/android-ndk-r14b
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'

if [ %1 -eq 'mobile' ]; then
  ARCH='armeabi-v7a'
else
  ARCH='x86'
fi

https://developer.android.com/ndk/downloads/older_releases.html#ndk-14-download
git clone https://code.videolan.org/videolan/vlc-android.git
pushd vlc-android
./compile.sh
./compile.sh -a $ARCH
popd
