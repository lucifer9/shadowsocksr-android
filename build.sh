#!/bin/bash

function try () {
"$@" || exit -1
}

try pushd src/main

# Build
#try $ANDROID_NDK_HOME/ndk-build clean
try ${ANDROID_NDK_HOME}/ndk-build -j2

# copy executables
rm -rf assets/arm64-v8a
mkdir -p assets/arm64-v8a
for app in pdnsd redsocks ss-local tun2socks
do
    try mv libs/arm64-v8a/$app assets/arm64-v8a/
done

try popd
