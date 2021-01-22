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
cd external/selinux
wget https://github.com/CyberJalagam/android_rom_building_scripts/raw/master/patches/Revert-libsepol:Make-an-unknown-permission-an-error-in-CIL.patch
git am Revert-"libsepol:Make-an-unknown-permission-an-error-in-CIL".patch 


# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone https://github.com/CPH1859/android_device_oppo_CPH1859 -b test-2 device/oppo/CPH1859

cp -r ../sakura-priv vendor

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone https://github.com/CPH1859/proprietary_vendor_oppo_CPH1859 vendor/oppo/CPH1859

# Kernel Tree
echo -e "\n================== Clonning kernel tree ==================\n"
git clone https://github.com/CPH1859/android_kernel_oppo_mt6771 kernel/oppo/mt6771
echo -e "\n Done!\n"

source build/envsetup.sh
lunch lineage_CPH1859-userdebug
export SAKURA_MAINTAINER=JAISHNAVPRASAD
export SKIP_ABI_CHECKS=true
export SAKURA_OFFICIAL=true
export TARGET_USES_BLUR=true
export LAWNCHAIR_OUTPUT=true
make bacon -j8
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
