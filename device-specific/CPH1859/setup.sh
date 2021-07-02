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
ROM_DIR=""

echo -e "${RED}"
echo " ~// Build environment for Realme 1 //~"
echo -e "${YELLOW}"
echo "Enter full rom directory"
echo -e "${RESET}"
read ROM_DIR

cd "$ROM_DIR"

# Sefix
cd external/selinux
git fetch --depth=1 https://github.com/PotatoProject/external_selinux 4b8de2fd5a38dd2fb477fd79cb85a1b0a33f745a
git cherry-pick FETCH_HEAD
cd ../../

# Obb fix
cd frameworks/native && git fetch --depth=1 https://github.com/phhusson/platform_frameworks_native cc94e422c0a8b2680e7f9cfc391b2b03a56da765 && git cherry-pick FETCH_HEAD
cd ../../

# Volte Patches
cd frameworks/base && git fetch --depth=1 https://github.com/Corvus-R/android_frameworks_base-staging a2c6a3997cdb4598c654b0dea6824286a5a3f727 && git cherry-pick FETCH_HEAD
cd ../../
cd frameworks/opt/net/wifi && git fetch --depth=1 https://github.com/PotatoProject/frameworks_opt_net_wifi 88773b8285d7962d0add6a9f55c63fc045beb677 && git cherry-pick FETCH_HEAD
cd ../../../../
cd frameworks/opt/net/ims && git fetch "http://gerrit.pixysos.com/PixysOS/frameworks_opt_net_ims" refs/changes/65/4665/1 && git cherry-pick FETCH_HEAD

# Go to initial directory
cd ../../../../
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
