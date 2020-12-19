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

DEVICE_TREE=""
DEVICE_TREE_BRANCH=""
ROM_DIR=""

echo "Enter full rom directory"
echo "eg, /home/cyberjalagam/potato"
read ROM_DIR


echo "Enter Device tree link: "
read DEVICE_TREE

echo "Enter Device tree branch: "
read DEVICE_TREE_BRANCH

cd "$ROM_DIR"

# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone "$DEVICE_TREE" -b "$DEVICE_TREE_BRANCH" device/oppo/CPH1859

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone https://github.com/CPH1859/proprietary_vendor_oppo_CPH1859 vendor/oppo/CPH1859

# Kernel Tree
echo -e "\n================== Clonning kernel tree ==================\n"
git clone https://github.com/CPH1859/android_kernel_oppo_mt6771 kernel/oppo/mt6771
echo -e "\n Done!\n"

# Clone some oss telephony repos
git clone https://github.com/PeterCxy/vendor_mediatek_hardware_interfaces vendor/mediatek/hardware/interfaces
git clone https://github.com/CPH1859/vendor_mediatek_hardware_telephony-ext vendor/mediatek/hardware/telephony-ext

# Revert an selinux commit
echo -e "\n======================== SeFix ============================\n"
cd external/selinux && git revert --no-edit `git log --oneline | grep "Make an unknown permission an error in CIL" | cut -d' ' -f 1`
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
