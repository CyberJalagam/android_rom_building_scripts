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

echo "enter full rom directory"
echo "eg, /home/cyberjalagam/potato"
read ROM_DIR

cd "$ROM_DIR"


# \some really necessary patches for IMS to work
cp -v ../scripts/patches/WifiManager:Add-StaState-API.patch frameworks/base
cd frameworks/base && git am WifiManager:Add-StaState-API.patch

cd ../../

cp -v ../scripts/patches/wifi:Add-StaState-API.patch frameworks/opt/net/wifi
cd frameworks/opt/net/wifi && git am wifi:Add-StaState-API.patch

cp -v ../../../../scripts/patches/Partially-Revert-Remove-references-to-deprecated-device.patch ../ims
cd ../ims && git am Partially-Revert-Remove-references-to-deprecated-device.patch
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
