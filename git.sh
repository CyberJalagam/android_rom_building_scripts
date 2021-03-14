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

GIT_USERNAME=""
GIT_MAIL=""
     
echo "Enter GitHub Username: "
read GIT_USERNAME

echo "Enter GitHub Email: "
read GIT_MAIL

# Username
echo -e "\n================== Adding Username ==================\n"
git config --global user.name "$GIT_USERNAME"
echo -e "\n Added your username!\n"

#Email
echo -e "\n==================   Adding Email   ==================\n"
git config --global user.email "$GIT_MAIL"
echo -e "\n Added your email!\n"

#List Settings
echo -e "\n==================   List Settings   ==================\n"
git config --list

#Aliases
echo -e "\n==================   Added Aliases   ==================\n"
git config --global alias.cp cherry-pick
git config --global alias.rb rebase
git config --global alias.cm commit
git config --global alias.f fetch
git config --global alias.co checkout
git config --global alias.rv revert
git config --global alias.b branch
git config --global alias.s status

echo Now u can use shortcuts for git commands!
echo "For "git cherry-pick" u can use  "git cp""
echo "For "git rebase"      u can use  "git rb""
echo "For "git commit"      u can use  "git cm""
echo "For "git fetch"       u can use  "git f""
echo "For "git checkout"    u can use  "git co""
echo "For "git revert"      u can use  "git rv""
echo "For "git branch"      u can use  "git b""
echo "For "git status"      u can use  "git s""

echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
