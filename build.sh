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


BOLD='\033[1m'
GRN='\033[01;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[01;31m'
RST='\033[0m'

ROM_ZIP_DIR=""
ROM_DIR=""

function options(){
if [ $1 -eq 1 ]
then
	chmod +x env.sh;
	bash env.sh;
	start;

elif [ $1 -eq 2 ]
then
	chmod +x env.sh;
       chmod +x git.sh;
       ./git.sh;
       ./env.sh;
       start;

elif [ $1 -eq 3 ]
then
	chmod +x git.sh;
	bash git.sh;
	start;

elif [ $1 -eq 4 ]
then
       chmod +x sync.sh;
       bash sync.sh;
       start;       

elif [ $1 -eq 5 ]
then
       chmod +x init.sh;
       bash init.sh;
       start;

elif [ $1 -eq 6 ]
then
       chmod +x build_rom.sh;
       bash build_rom.sh;
       start;
       
elif [ $1 -eq 7 ]
then
       chmod +x error.sh;
       bash error.sh;
       start;

elif [ $1 -eq 8 ]
then
        chmod +x upload.sh;
        bash upload.sh;
        start;


elif [ $1 -eq 9 ]
then
	sudo apt -y install python3;
       python3 gsi.py;
	start;

elif [ $1 -eq 10 ]
then
	chmod +x volte.sh;
	bash volte.sh;
	start;


elif [ $1 -eq 11 ]
then
       chmod +x sefix.sh;
       bash sefix.sh
       start;

elif [ $1 -eq 12 ]
then
       chmod +x obb.sh;
       bash obb.sh
       start;

elif [ $1 -eq 13 ]
then
	exit;
fi
}

function start(){
echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
echo -e "${RED}"
echo "----------------------------------------"
echo "Welcome to ANDROID ROM BUILDING SCRIPTS"
echo "----------------------------------------"
sleep 2;
echo -e "${YELLOW}"
echo "1  -- Build ENV necessary packages"
echo "2  -- All env essentials (env and git)"
echo "3  -- Setup git"
echo "4  -- Sync a rom source"
echo "5  -- Initialize device repos"
echo "6  -- Build rom"
echo "7  -- Show build error"
echo "8  -- Upload rom"
echo "9  -- Build sGSI"
echo "10 -- Apply VoLTE patches for MediaTek"
echo "11 -- Fix selinux for realme mtk devices"
echo "12 -- Apply changes to make obb visible"
echo "13 -- Exit"
echo -e "${RST}"
read -p "Enter choice: " n;
options $n;
}

start;
