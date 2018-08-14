#! /bin/bash
export PROJ_DIR=`pwd`
export ANDROID_SDK="$PROJ_DIR/sdk"
export ANDROID_NDK="$PROJ_DIR/ndk/android-ndk-r14b"

# Linux 
linux_install(){
  mkdir -p $ANDROID_SDK
  mkdir -p $ANDROID_NDK

  # Download dependencies
  curl "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" -o sdk-tools-linux.zip
  curl "https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip" -o android-ndk-r14b-linux.zip
  
  unzip sdk-tools-linux.zip -d sdk/
  unzip android-ndk-r14b-linux.zip -d ndk/

  sudo apt-get install automake ant autopoint cmake build-essential libtool \
    patch pkg-config protobuf-compiler ragel subversion unzip git \
    openjdk-8-jre openjdk-8-jdk flex
  sudo dpkg --add-architecture i386
  sudo apt-get update
  sudo apt-get install zlib1g:i386 libstdc++6:i386 libc6:i386
}

# macOS
macos_install(){
  mkdir -p $ANDROID_SDK
  mkdir -p $ANDROID_NDK

  # Download dependencies
  curl "https://dl.google.com/android/repository/sdk-tools-darwin-4333796.zip" -o sdk-tools-linux.zip
  curl "https://dl.google.com/android/repository/android-ndk-r14b-darwin-x86_64.zip" -o android-ndk-r14b-darwin.zip
  
  unzip sdk-tools-darwin.zip -d sdk/
  unzip android-ndk-r14b-darwin.zip -d ndk/
}

# Build both native and emulator versions
build(){
  if [ `uname` == "Darwin" ] ; then
    # macOS!
    export JAVA_HOME='/Library/Java/Home/'
  else
    # Linux!
    export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
  fi

  pushd vlc-android
  ./compile.sh
  ./compile.sh -a x86
  ./compile.sh -a armeabi-v7a
  popd
}

if [ -n "$1" ] && [ "$1" == "build" ] ; then 
  build
elif [ -n "$1" ] && [ "$1" == "prep" ] ; then
  if [ `uname` == "Darwin" ] ; then 
    macos_install
  else 
    linux_install
  fi
else 
  echo "Try \"$0 build\" or \"$0 prep\"" 
fi
