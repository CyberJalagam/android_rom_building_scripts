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

ROM_DIR=""

echo " ~// Build environment for Realme 1 //~"
echo "Enter full rom directory"
read ROM_DIR

cd "$ROM_DIR"

# Sefix
cd external/selinux && git revert --no-edit `git log --oneline | grep "Make an unknown permission an error in CIL" | cut -d' ' -f 1`
cd ../../

# Obb fix
cd frameworks/native && git fetch https://github.com/phhusson/platform_frameworks_native android-11.0.0_r28-phh && git cherry-pick cc94e422c0a8b2680e7f9cfc391b2b03a56da765
cd ../../

# Volte Patches
cd frameworks/base && git fetch https://github.com/Corvus-R/android_frameworks_base-staging 11 && git cherry-pick a2c6a3997cdb4598c654b0dea6824286a5a3f727
cd ../../
cd frameworks/opt/net/wifi && git fetch https://github.com/PotatoProject/frameworks_opt_net_wifi dumaloo-release && git cherry-pick 88773b8285d7962d0add6a9f55c63fc045beb677
cd ../../../../
cd frameworks/opt/net/ims && git fetch "http://gerrit.pixysos.com/PixysOS/frameworks_opt_net_ims" refs/changes/65/4665/1 && git cherry-pick FETCH_HEAD

# Go to initial directory
cd ../../../../