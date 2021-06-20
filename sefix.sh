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

echo -e "${RED}"
echo " ~// Selinux patching Script //~"

ROM_DIR=""

echo -e "${YELLOW}"
echo "Enter full rom directory"
echo "eg, /home/cyberjalagam/potato"
echo -e "${RESET}"
read ROM_DIR
cd "$ROM_DIR"

# Revert an selinux commit
echo -e "${YELLOW}"
echo -e "\n======================== SeFix ============================\n"
cd external/selinux
echo -e "${RESET}" 
wget https://github.com/CyberJalagam/android_rom_building_scripts/raw/master/patches/Revert-libsepol:Make-an-unknown-permission-an-error-in-CIL.patch
git am Revert-"libsepol:Make-an-unknown-permission-an-error-in-CIL".patch 

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
echo -e "${RESET}"
