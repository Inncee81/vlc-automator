#! /bin/bash
# Linux 
linux_install(){
  export PROJ_DIR=`pwd`
  export ANDROID_SDK="$PROJ_DIR/sdk/sdk-tools-linux"
  export ANDROID_NDK="$PROJ_DIR/ndk/android-ndk-r14b-linux"
  export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
  
  mkdir -p $ANDROID_SDK
  mkdir -p $ANDROID_NDK

  # Download dependencies
  curl "https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" -o sdk-tools-linux.zip
  curl "https://dl.google.com/android/repository/android-ndk-r14b-linux-x86_64.zip" -o android-ndk-r14b-linux.zip
  
  unzip sdk-tools-linux.zip -d sdk/sdk-tools-linux
  unzip android-ndk-r14b-linux.zip -d ndk/android-ndk-r14b-linux

  sudo apt-get install automake ant autopoint cmake build-essential libtool \
    patch pkg-config protobuf-compiler ragel subversion unzip git \
    openjdk-8-jre openjdk-8-jdk flex
  sudo dpkg --add-architecture i386
  sudo apt-get update
  sudo apt-get install zlib1g:i386 libstdc++6:i386 libc6:i386

  if [ %1 -eq 'mobile' ]; then
    ARCH='armeabi-v7a'
  else
    ARCH='x86'
  fi

  pushd vlc-android
  ./compile.sh
  ./compile.sh -a $ARCH
  popd
}

# macOS
macos_install(){
  export PROJ_DIR=`pwd`
  export ANDROID_SDK="$PROJ_DIR/sdk/sdk-tools-darwin"
  export ANDROID_NDK="$PROJ_DIR/ndk/android-ndk-r14b-darwin"
  export JAVA_HOME='/Library/Java/Home/'

  mkdir -p $ANDROID_SDK
  mkdir -p $ANDROID_NDK

  # Download dependencies
  curl "https://dl.google.com/android/repository/sdk-tools-darwin-4333796.zip" -o sdk-tools-linux.zip
  curl "https://dl.google.com/android/repository/android-ndk-r14b-darwin-x86_64.zip" -o android-ndk-r14b-darwin.zip
  
  unzip sdk-tools-darwin.zip -d sdk/sdk-tools-darwin
  unzip android-ndk-r14b-darwin.zip -d ndk/android-ndk-r14b-darwin

  if [ %1 -eq 'mobile' ]; then
    ARCH='armeabi-v7a'
  else
    ARCH='x86'
  fi

  pushd vlc-android
  ./compile.sh
  ./compile.sh -a $ARCH
  popd
}
