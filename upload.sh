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

echo -r "${RED}"
echo " ~// Rom uploading Script //~"

FILE_NAME=""
ROM_DIR=""
CODENAME=""

echo -e "${GREEN}"
chmod +x gdrive
sudo install assets/gdrive /usr/local/bin/gdrive

echo -e "${YELLOW}"
echo "===================================="
echo "Enter full rom directory"
echo "eg, /home/jaishnavprasad/sakura"
echo -e "${RESET}"
read ROM_DIR

echo -e "${YELLOW}"
echo "===================================="
echo "Enter codename"
echo "eg, begonia, CPH1859 etc..."
echo -e "${RESET}"
read CODENAME

cd "$ROM_DIR"/out/target/product/"$CODENAME"
ls
echo -e "${YELLOW}"
echo "=============================================================="
echo "=============================================================="
echo "Enter the rom name"
echo -e "${RESET}"
read FILE_NAME

echo -e "${YELLOW}"
echo "===================================="
echo " Press y to use gdrive "
echo " Press n to use we transfer"
echo "===================================="
echo -e "${RESET}"
read -p " y or n " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  if [ ! -d transfer ]
  then
  curl -sL https://git.io/file-transfer | sh
  fi
  ./transfer wet "$ROM_DIR"/out/target/product/"$CODENAME"/"$FILE_NAME"
else
  gdrive upload "$ROM_DIR"/out/target/product/"$CODENAME"/"$FILE_NAME"
fi 
  

#curl https://bashupload.com/"$FILE_NAME" --data-binary @"$ROM_DIR"/out/target/product/"$CODENAME"/"$FILE_NAME"
echo -e "${GREEN}"
echo "Operation sucessful!, file has been uploaded"

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
echo -e "${RESET}"