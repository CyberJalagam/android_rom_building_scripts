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

chmod +x gdrive  
sudo install gdrive /usr/local/bin/gdrive
gdrive list
wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh
bash android_build_env.sh
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get -y update
sudo apt-get install -y python3.6
export USE_CCACHE=1
export USE_CCACHE_EXEC=$(command -v ccache)
ccache -M 50G
export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
