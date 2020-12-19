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

BRAND=""
CODENAME=""

VENDOR_TREE=""
VENDOR_TREE_BRANCH=""

KERNEL_TREE=""
KERNEL_TREE_BRANCH=""

CHIPSET=""
ROM_DIR=""

echo "Enter full rom directory: "
echo "eg, /home/cyberjalagam/potato"
read ROM_DIR

echo "Enter codename: "
read CODENAME

echo "Enter Brand: "
read BRAND

echo "Enter chipset (for kernel path): "
read CHIPSET

echo "Enter Device tree link: "
read DEVICE_TREE

echo "Enter Device tree branch: "
read DEVICE_TREE_BRANCH

echo "Enter Vendor tree link: "
read VENDOR_TREE

echo "Enter Vendor tree branch: "
read VENDOR_TREE_BRANCH

echo "Enter Kernel tree link: "
read KERNEL_TREE

echo "Enter Kernel tree branch: "
read KERNEL_TREE_BRANCH

cd "$ROM_DIR"

# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone "$DEVICE_TREE" -b "$DEVICE_TREE_BRANCH" device/"$BRAND"/"$CODENAME"

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone "$VENDOR_TREE" -b "$VENDOR_TREE_BRANCH" vendor/"$BRAND"/"$CODENAME"

# Kernel Tree
echo -e "\n================== Clonning kernel tree ==================\n"
git clone "$KERNEL_TREE" -b "$KERNEL_TREE_BRANCH" kernel/"$BRAND"/"$CHIPSET"

echo -e "\n Done!\n"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
