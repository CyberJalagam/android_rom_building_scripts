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
ROM_DIR_HEHE

echo "enter rom short name"
echo " eg, lineage_CPH1859.mk, so, lineage"
read ROM_NAME

echo "enter full rom directory"
echo "eg, /home/cyberjalagam/potato"
read ROM_DIR_HEHE


echo "enter codename"
read CODENAME

cd "$ROM_DIR_HEHE"

# Metalava
cp -v ../scripts/patches/Specified-the-heap-size-with-the-flag-to-fix-out-of-memory-error.patch build/soong
cd build/soong && git am Specified-the-heap-size-with-the-flag-to-fix-out-of-memory-error.patch
cd ../../
#Metalava

source build/envsetup.sh
lunch "$ROM_NAME"_"$CODENAME"-userdebug
mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && mka bacon -j$(nproc --all)
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
