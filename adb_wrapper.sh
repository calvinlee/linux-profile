#!/bin/sh

echo $@
ADB_BIN=~/android/android-sdk-linux_86/platform-tools/adb
SUB_CMD=$1

case $SUB_CMD in
    logcat)
    if type coloredlogcat.py > /dev/null; then
        coloredlogcat.py -v time
    else
        $ADB_BIN logcat -v time
    fi
    ;;
esac
