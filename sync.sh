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

DIR=""
ROM_MANIFEST=""
BRANCH_NAME=""

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"

echo -e "${YELLOW}"
echo "Enter full directory of rom folder"
echo -e "${RESET}"
read DIR

cd "$DIR"

echo -e "${YELLOW}"
echo "Enter the link of rom manifest: "
echo -e "${RESET}"
read ROM_MANIFEST
echo -e "${YELLOW}"
echo "===================================="
echo "Enter the branch: "
echo -e "${RESET}"
read BRANCH_NAME
echo -e "${YELLOW}"
echo "===================================="

echo "Do you need an optimised sync?"
echo "This will shallow clone all repos"
echo -e "${GREEN}"
echo "Pressing n will do a normal sync"
echo "===================================="
echo -e "${YELLOW}"
read -p "y or n " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    repo init --depth=1 -u "$ROM_MANIFEST" -b "$BRANCH_NAME"
    echo -e "${GREEN}"
    echo "===================================="
    echo " Syncing repo. This may take a while depending on your internet speed : "
    echo "===================================="
    echo -e "${RESET}"
    repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
else
   repo init -u "$ROM_MANIFEST" -b "$BRANCH_NAME"
   echo -e "${GREEN}"
   echo "===================================="
   echo " Syncing repo. This may take a while depending on your internet speed : "
   echo "===================================="
   echo -e "${RESET}"
   repo sync --force-sync -j$(nproc --all)
fi   

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
echo -e "${RESET}"