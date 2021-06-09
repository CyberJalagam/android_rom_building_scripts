#!/bin/bash

# 
# Copyright (C) 2020 RB INTERNATIONAL NETWORK
#
#            An Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"

ROM_NAME=""
CODENAME=""
ROM_DIR_HEHE=""
VARIENT=""

if [ `whoami` == 'root' ]
  then 
   echo "Please don't run this script as a root user"
   echo "Exiting..."
	 exit
fi

export USE_CCACHE=1
export USE_CCACHE_EXEC=$(command -v ccache)
ccache -M 50G
export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"

echo "enter full rom directory"
echo "eg, /home/cyberjalagam/potato"
read ROM_DIR_HEHE

echo "enter rom short name"
echo " eg, lineage_CPH1859.mk, so, lineage"
read ROM_NAME

echo "enter codename"
read CODENAME

echo "enter the build varient"
echo "eg, eng | user | userdebug"
read VARIENT

cd "$ROM_DIR_HEHE"

echo "Do you have a machine with low specs?"
read -p "y or n " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then

  # Metalava
  cd build/soong
  wget https://raw.githubusercontent.com/CyberJalagam/android_rom_building_scripts/master/patches/Specified-the-heap-size-with-the-flag-to-fix-out-of-memory-error.patch
  git am Specified-the-heap-size-with-the-flag-to-fix-out-of-memory-error.patch
  cd ../../
  #Metalava

  . build/envsetup.sh
  lunch "$ROM_NAME"_"$CODENAME"-"$VARIENT"
  mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && mka bacon -j$(nproc --all)


else
  . build/envsetup.sh
  lunch "$ROM_NAME"_"$CODENAME"-"$VARIENT"
  mka bacon -j$(nproc --all)
fi 

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"







