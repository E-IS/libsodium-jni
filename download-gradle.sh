#!/bin/bash -ev

. ./setenv.sh

pushd ./installs
test -e "gradle-${GRADLE_VERSION}-bin.zip" || wget --quiet https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
test -e "gradle-${GRADLE_VERSION}" || unzip -qq "gradle-${GRADLE_VERSION}"-bin.zip

test -e "sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip" || wget --quiet https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip
test -e "android-sdk" || unzip -qq sdk-tools-linux-${ANDROID_SDK_TOOLS_VERSION}.zip -d android-sdk
popd

mkdir -p ${ANDROID_HOME}/licenses
echo 8933bad161af4178b1185d1a37fbf41ea5269c55 > ${ANDROID_HOME}/licenses/android-sdk-license
echo 601085b94cd77f0b54ff86406957099ebe79c4d6 > ${ANDROID_HOME}/licenses/android-googletv-license
echo 33b6a2b64607f11b759f320ef9dff4ae5c47d97a > ${ANDROID_HOME}/licenses/google-gdk-license
yes | sdkmanager --licenses

mkdir -p ~/.android
touch ~/.android/repositories.cfg
