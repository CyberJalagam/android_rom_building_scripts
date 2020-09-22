#!/bin/bash
#
# Script to setup git

# Username
echo -e "\n================== Adding Username ==================\n"
git config --global user.name "CyberJalagam"
echo -e "\n Added your username!\n"

#Email
echo -e "\n==================   Adding Email   ==================\n"
git config --global user.email "rbinternationalnetwork@gmail.com"
echo -e "\n Added your email!\n"

#List Settings
echo -e "\n==================   List Settings   ==================\n"
git config --list
