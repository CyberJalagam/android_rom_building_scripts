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

# Apply obb patch
echo -e "\n======================== Obb patch ============================\n"
cd frameworks/native && git fetch https://github.com/phhusson/platform_frameworks_native android-11.0.0_r28-phh && git cherry-pick cc94e422c0a8b2680e7f9cfc391b2b03a56da765
cd ../../
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
