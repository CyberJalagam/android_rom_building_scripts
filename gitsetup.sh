#!/bin/bash
#
# Script to setup git

GIT_USERNAME=""
GIT_MAIL=""
     
echo "Enter GitHub Username: "
read GIT_USERNAME

echo "Enter GitHub Email: "
read GIT_EMAIL

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
