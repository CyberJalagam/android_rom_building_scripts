#!/bin/bash
#
# This script is personal
# Make sure to make necessary changes
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

echo -e "${RED}"
echo " ~// Rom error reading Script //~"

echo -e "${RESET}"

if [ ! -d go1.16.5.linux-amd64.tar.gz ]
then
# Go
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz;
sudo tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz;
export PATH=$PATH:/usr/local/go/bin;

# inu
GO111MODULE=on go get -u github.com/dogbin/inu;
[[ $PATH != ?(*:)$HOME/go/bin?(:*) ]] && export PATH=$HOME/go/bin:$PATH;
fi

echo -e "${YELLOW}"
echo "Type in the full directory of rom folder";
echo "eg, /home/cyberjalagam/sakura";
echo -e "${RESET}"
read ROM_DIR;
cat "$ROM_DIR"/out/error.log;
echo -e "${YELLOW}"
echo "====================================================================";
echo -e "${RED}"
echo "Error link:";
echo -e "${RESET}"
cat "$ROM_DIR"/out/error.log | inu;

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"   
echo -e "${RESET}"
