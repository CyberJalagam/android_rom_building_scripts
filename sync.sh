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

DIR=""
ROM_MANIFEST=""
BRANCH_NAME=""

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"

echo "Enter full directory of rom folder"
read DIR

cd "$DIR"

echo "Enter the link of rom manifest: "
read ROM_MANIFEST

echo "Enter the branch: "
read BRANCH_NAME

echo "Do you need an optimised sync?"
echo "This will shallow clone all repos"
echo "Pressing n will do a normal sync"
read -p "y or n " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    repo init --depth=1 -u "$ROM_MANIFEST" -b "$BRANCH_NAME"
    echo " Syncing repo. This may take a while depending on your internet speed : "
    repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
else
   repo init -u "$ROM_MANIFEST" -b "$BRANCH_NAME"
   echo " Syncing repo. This may take a while depending on your internet speed : "
   repo sync --force-sync -j$(nproc --all)
fi   

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
