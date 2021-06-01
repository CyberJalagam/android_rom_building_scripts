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

echo -e "\n Adding your github credentials\n"

git config --global user.email "${{ secrets.TOKEN }}"
git config --global user.name "${{ secrets.USERNAME }}"
git config --global credential.helper store
echo "https://${{ secrets.USERNAME }}:${{ secrets.TOKEN }}@github.com" > ~/.git-credentials

echo -e "\n Credentials added!\n"


echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
