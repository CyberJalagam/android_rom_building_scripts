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

FILE_NAME=""
ROM_DIR=""
CODENAME=""

chmod +x gdrive
sudo install assets/gdrive /usr/local/bin/gdrive

echo "Enter full rom directory"
echo "eg, /home/jaishnavprasad/sakura"
read ROM_DIR

echo "Enter codename"
echo "eg, begonia, CPH1859 etc..."
read CODENAME

cd "$ROM_DIR"/out/target/product/"$CODENAME"
ls
echo "=============================================================="
echo "=============================================================="
echo "enter the rom name"
read FILE_NAME

echo " Press y to use gdrive "
echo " Press n to use we transfer"
read -p " y or n " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  gdrive upload "$ROM_DIR"/out/target/product/"$CODENAME"/"$FILE_NAME"
else
  if [ ! -d transfer ]
  then
  curl -sL https://git.io/file-transfer | sh
  fi
 ./transfer wet "$ROM_DIR"/out/target/product/"$CODENAME"/"$FILE_NAME"
fi 
  

#curl https://bashupload.com/"$FILE_NAME" --data-binary @"$ROM_DIR"/out/target/product/"$CODENAME"/"$FILE_NAME"
echo "Operation sucessful!, file has been uploaded"

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
