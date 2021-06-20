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

echo -e "${RED}"
echo " ~// Github environment script //~"

echo -e "${RESET}"

GIT_USERNAME=""
GIT_MAIL=""

echo -e "${YELLOW}"
echo "Enter GitHub Username: "
echo -e "${RESET}"
read GIT_USERNAME
echo -e "${YELLOW}"
echo "===================================="
echo "Enter GitHub Email: "
echo -e "${RESET}"
read GIT_MAIL

echo -e "${YELLOW}"
# Username
echo -e "\n================== Adding Username ==================\n"
git config --global user.name "$GIT_USERNAME"
echo -e "${GREEN}"
echo -e "\n Added your username!\n"

echo -e "${YELLOW}"
#Email
echo -e "\n==================   Adding Email   ==================\n"
git config --global user.email "$GIT_MAIL"
echo -e "${GREEN}"
echo -e "\n Added your email!\n"

echo -e "${YELLOW}"
#List Settings
echo -e "\n==================   List Settings   ==================\n"
echo -e "${RESET}"
git config --list

echo -e "${YELLOW}"
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
git config --global alias.cpc "cherry-pick --continue"
git config --global alias.cpa "cherry-pick --abort"

echo -e "${YELLOW}"
echo "Now u can use shortcuts for git commands!"
echo -e "${GREEN}"
echo "----------------------------------------------------------"
echo "- ====================================================== -"
echo "- | For git cherry-pick  ------     u can use  git cp  | -"
echo "- | For git rebase       ------     u can use  git rb  | -"
echo "- | For git commit       ------     u can use  git cm  | -"
echo "- | For git fetch        ------     u can use  git f   | -"
echo "- | For git checkout     ------     u can use  git co  | -"
echo "- | For git revert       ------     u can use  git rv  | -"
echo "- | For git branch       ------     u can use  git b   | -"
echo "- | For git status       ------     u can use  git s   | -"
echo "- | For git cherry-pick --continue  u can use  git cpc | -"
echo "- | For git cherry-pick --abort     u can use  git cpa | -"
echo "- ====================================================== -"
echo "----------------------------------------------------------"

echo -e "${CYAN}"
echo "<<<<< © RB INTERNATIONAL NETWORK™ >>>>>"
echo -e "${RESET}"
