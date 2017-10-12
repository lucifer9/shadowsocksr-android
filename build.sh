#!/bin/bash

function try () {
"$@" || exit -1
}

try pushd src/main

# Build
#try $ANDROID_NDK_HOME/ndk-build clean
try ${ANDROID_NDK_HOME}/ndk-build -j2

# copy executables
rm -rf assets/armeabi-v7a
mkdir -p assets/armeabi-v7a
for app in pdnsd redsocks ss-local tun2socks
do
    try mv libs/armeabi-v7a/$app assets/armeabi-v7a/
done

try popd
