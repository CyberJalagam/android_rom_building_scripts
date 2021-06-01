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
        chmod +x upload.sh;
        bash upload.sh;
        start;

elif [ $1 -eq 4 ]
then
	chmod +x init-CPH1859.sh;
	bash init-CPH1859.sh;
	start;

elif [ $1 -eq 5 ]
then
	chmod +x volte.sh;
	bash volte.sh;
	start;

elif [ $1 -eq 6 ]
then
	chmod +x git.sh;
	bash git.sh;
	start;

elif [ $1 -eq 7 ]
then
	chmod +x full_build_script.sh;
	bash full_build_script.sh;
	start;

elif [ $1 -eq 8 ]
then
       chmod +x build_low_spec.sh;
       bash build_low_spec.sh;
       start;

elif [ $1 -eq 9 ]
then
       chmod +x build_high_spec.sh;
       bash build_high_spec.sh;
       start;

elif [ $1 -eq 10 ]
then  
       chmod +x AIO.sh;
       bash AIO.sh;
       start;

elif [ $1 -eq 11 ]
then
       chmod +x sakura-CPH1859.sh;
       bash sakura-CPH1859.sh;
       start;

elif [ $1 -eq 12 ]
then
       chmod +x sakura-RMX1831.sh;
       bash sakura-RMX1831.sh;
       start;
       
elif [ $1 -eq 13 ]
then
       chmod +x error.sh;
       bash error.sh;
       start;

elif [ $1 -eq 14 ]
then
       chmod +x init.sh;
       bash init.sh;
       start;

elif [ $1 -eq 15 ]
then
       chmod +x sefix.sh;
       bash sefix.sh
       start;

elif [ $1 -eq 16 ]
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
echo "2  -- All env essentials- env and git"
echo "3  -- Upload rom"
echo "4  -- Initialize device configuration for CPH1859"
echo "5  -- Initialize VoLTE changes for MediaTek"
echo "6  -- Setup git"
echo "7  -- Full rom building script"
echo "8  -- Build with low specs"
echo "9  -- Build with normal specs"
echo "10 -- AIO Descendant, sakura, fusion, RR builds"
echo "11 -- Build ProjectSakura for CPH1859"
echo "12 -- Build ProjectSakura for RMX1831"
echo "13 -- Show build error"
echo "14 -- Initialize device repos"
echo "15 -- SeFIX for CPH1859 & RMX1831"
echo "16 -- Exit"
echo -e "${RST}"
read -p "Enter choice: " n;
options $n;
}

start;
