#!/bin/bash
# Calvin.Lee<lihao921@gmail.com> @ Wed Dec 12 12:20:05 CST 2012
# Simple adb command wrapper script.

SUB_CMD=$1
ADB_BIN=~/android/android-sdk-linux_86/platform-tools/adb

# drop the first sub command, like logcat, push, etc
#shift 1

case $SUB_CMD in
    logcat)
    #if type coloredlogcat.py > /dev/null; then
    #    coloredlogcat.py -v time
    #else
    $ADB_BIN $@ -v time
    #fi
    ;;

    push)
    $ADB_BIN root
    $ADB_BIN remount
    $ADB_BIN $@
    ;;

    *)
    $ADB_BIN
    ;;
esac
