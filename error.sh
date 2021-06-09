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

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"

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

echo "Type in the full directory of rom folder";
echo "eg, /home/cyberjalagam/sakura";
read ROM_DIR;
cat "$ROM_DIR"/out/error.log;
echo "====================================================================";
echo "Error link:";
cat "$ROM_DIR"/out/error.log | inu;
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"   
