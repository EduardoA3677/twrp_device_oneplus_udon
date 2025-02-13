#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2020-2021 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
FDEVICE="udon"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep \"$FDEVICE\")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep \"$FDEVICE\")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
     	echo "test =============="
	export FOX_VERSION="R12.2"
fi
# Initial Info
    export ALLOW_MISSING_DEPENDENCIES=true
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export LC_ALL="C"
  
# Maintaining Info
    export OF_MAINTAINER="EduardoA3677"
    export FOX_VERSION=$(date +%y.%m.%d)
    export FOX_BUILD_TYPE=Unofficial
  	
# Device Info
    export FOX_ARCH=arm64
    export FOX_VARIANT="12.1"
	 export TARGET_DEVICE_ALT="PHK110, CPH2487, udon, OP5913L1, OP5961L1, ossi, qssi"
    export FOX_TARGET_DEVICES="PHK110, CPH2487 ,udon ,OP5913L1, OP5961L1, ossi, qssi"
    export FOX_USE_SPECIFIC_MAGISK_ZIP=$(pwd)/device/oneplus/udon/Magisk-v28.0.zip

# Funtions
    export FOX_REPLACE_BUSYBOX_PS=1
    export FOX_REPLACE_TOOLBOX_GETPROP=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_GREP_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export FOX_USE_NANO_EDITOR=1
    export OF_ENABLE_LPTOOLS=1
    export FOX_DELETE_AROMAFM=1
  
# Display Settings

    export OF_ALLOW_DISABLE_NAVBAR=0
    export OF_USE_GREEN_LED=0

    export OF_SCREEN_H=2412
    export OF_STATUS_H=106
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_HIDE_NOTCH=1
    export OF_CLOCK_POS=1
    export OF_OPTIONS_LIST_NUM=6
    export OF_SPLASH_MAX_SIZE=16384

# A/B-Related
    export OF_AB_DEVICE_WITH_RECOVERY_PARTITION=1
    export FOX_VIRTUAL_AB_DEVICE=1
    export OF_VANILLA_BUILD=0
  
# Other Patches

    export OF_FBE_METADATA_MOUNT_IGNORE=1

    export OF_NO_SPLASH_CHANGE=1

	lunch twrp_$FDEVICE-eng
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
