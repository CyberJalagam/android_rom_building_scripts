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

echo -e "${YELLOW}"
echo "Enter full rom directory: "
echo "eg, /home/cyberjalagam/potato"
echo -e "${RESET}"
read ROM_DIR

echo -e "${YELLOW}"
echo "===================================="
echo "Enter codename: "
echo -e "${RESET}"
read CODENAME

echo -e "${YELLOW}"
echo "===================================="
echo "Enter Brand: "
echo -e "${RESET}"
read BRAND

echo -e "${YELLOW}"
echo "===================================="
echo "Enter chipset (for kernel path): "
echo -e "${RESET}"
read CHIPSET

echo -e "${YELLOW}"
echo "===================================="
echo "Enter Device tree link: "
echo -e "${RESET}"
read DEVICE_TREE

echo -e "${YELLOW}"
echo "===================================="
echo "Enter Device tree branch: "
echo -e "${RESET}"
read DEVICE_TREE_BRANCH

echo -e "${YELLOW}"
echo "===================================="
echo "Enter Vendor tree link: "
echo -e "${RESET}"
read VENDOR_TREE

echo -e "${YELLOW}"
echo "===================================="
echo "Enter Vendor tree branch: "
echo -e "${RESET}"
read VENDOR_TREE_BRANCH

echo -e "${YELLOW}"
echo "===================================="
echo "Enter Kernel tree link: "
echo -e "${RESET}"
read KERNEL_TREE

echo -e "${YELLOW}"
echo "===================================="
echo "Enter Kernel tree branch: "
echo -e "${RESET}"
read KERNEL_TREE_BRANCH

cd "$ROM_DIR"
echo -e "${YELLOW}"
# Device tree
echo -e "\n================== Clonning device tree ==================\n"
echo -e "${GREEN}"
git clone "$DEVICE_TREE" -b "$DEVICE_TREE_BRANCH" device/"$BRAND"/"$CODENAME"

# Vendor Tree
echo -e "${YELLOW}"
echo -e "\n================== Clonning vendor tree ==================\n"
echo -e "${GREEN}"
git clone "$VENDOR_TREE" -b "$VENDOR_TREE_BRANCH" vendor/"$BRAND"/"$CODENAME"

# Kernel Tree
echo -e "${YELLOW}"
echo -e "\n================== Clonning kernel tree ==================\n"
echo -e "${GREEN}"
git clone "$KERNEL_TREE" -b "$KERNEL_TREE_BRANCH" kernel/"$BRAND"/"$CHIPSET"

echo -e "${YELLOW}"
echo -e "\n Done!\n"

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
echo -e "${RESET}"