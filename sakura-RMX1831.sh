#!/bin/bash
#
# This script is personal
# Make sure to make necessary changes
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

# Username
echo -e "\n================== Adding Username ==================\n"
git config --global user.name "CyberJalagam"
echo -e "\n Added your username!\n"

#Email
echo -e "\n==================   Adding Email   ==================\n"
git config --global user.email "rbinternationalnetwork@gmail.com"
echo -e "\n Added your email!\n"

#List Settings
echo -e "\n==================   List Settings   ==================\n"
git config --list

wget https://raw.githubusercontent.com/CyberJalagam/android_rom_building_scripts/master/env.sh
chmod +x env.sh
bash env.sh

# Lets setup the rom
cd && mkdir sakura && cd sakura
repo init -u git://github.com/ProjectSakura/android.git -b 11
repo sync --current-branch --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j8

# Revert an selinux commit
echo -e "\n======================== SeFix ============================\n"
cp -v ../scripts/patches/Revert-"libsepol:Make-an-unknown-permission-an-error-in-CIL".patch external/selinux
cd external/selinux && git am Revert-"libsepol:Make-an-unknown-permission-an-error-in-CIL".patch 

# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone https://github.com/CyberJalagam/device_realme_RMX1831 -b lineage-18.0 device/realme/RMX1831

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone https://github.com/SparXFusion/android_vendor_realme_RMX1831 -b lineage-18.0 vendor/realme/RMX1831

echo -e "\n Done!\n"

source build/envsetup.sh
lunch lineage_RMX1831-userdebug
export SAKURA_MAINTAINER=JAISHNAVPRASAD
export SKIP_ABI_CHECKS=true
export LAWNCHAIR_OUTPUT=true
make bacon -j8
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
