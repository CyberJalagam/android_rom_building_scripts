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

ROM_DIR=""

echo "Enter full rom directory"
echo "eg, /home/cyberjalagam/potato"
read ROM_DIR
cd "$ROM_DIR"

# Revert an selinux commit
echo -e "\n======================== SeFix ============================\n"
cd external/selinux 
wget https://github.com/CyberJalagam/android_rom_building_scripts/raw/master/patches/Revert-libsepol:Make-an-unknown-permission-an-error-in-CIL.patch
git am Revert-"libsepol:Make-an-unknown-permission-an-error-in-CIL".patch 
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
