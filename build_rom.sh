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

RESET='\033[0m'       # Text Reset
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"


ROM_NAME=""
CODENAME=""
ROM_DIR_HEHE=""
VARIENT=""

if [ `whoami` == 'root' ]
  then
   echo -e "${YELLOW}" 
   echo "Please don't run this script as a root user"
   echo -e "${RED}"
   echo "Exiting..."
	 exit
fi

echo -e "${RESET}"

export USE_CCACHE=1
export USE_CCACHE_EXEC=$(command -v ccache)
ccache -M 50G
export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"

echo -e "${YELLOW}"
echo "enter full rom directory"
echo "eg, /home/cyberjalagam/potato"
echo -e "${RESET}"
read ROM_DIR_HEHE

echo -e "${YELLOW}"
echo "===================================="
echo "enter rom short name"
echo " eg, lineage_CPH1859.mk, so, lineage"
echo -e "${RESET}"
read ROM_NAME

echo -e "${YELLOW}"
echo "===================================="
echo "enter codename"
echo -e "${RESET}"
read CODENAME

echo -e "${YELLOW}"
echo "===================================="
echo "enter the build varient"
echo "eg, eng | user | userdebug"
echo -e "${RESET}"
read VARIENT

cd "$ROM_DIR_HEHE"
echo -e "${YELLOW}"
echo "===================================="
echo "Do you have a machine with low specs?"
echo "===================================="
echo -e "${RESET}"
read -p "y or n " -n 1 -r
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

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
echo -e "${RESET}"







