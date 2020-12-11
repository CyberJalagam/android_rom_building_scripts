#!/bin/bash
#
# This script is personal
# Make sure to make necessary changes

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

wget https://raw.githubusercontent.com/CyberJalagam/android_rom_building_scripts/master/env.sh
chmod +x env.sh
bash env.sh

# Lets setup the rom
cd && mkdir sakura && cd sakura
repo init -u git://github.com/ProjectSakura/android.git -b 11
repo sync --current-branch --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j8

# Revert an selinux commit
echo -e "\n======================== SeFix ============================\n"
cd external/selinux && git revert --no-edit `git log --oneline | grep "Make an unknown permission an error in CIL" | cut -d' ' -f 1`

# Add some changes to source for hotspot fix
cd ../../ && cd frameworks/opt/net/wifi && git fetch https://github.com/PotatoProject/frameworks_opt_net_wifi dumaloo-release && git cherry-pick 88773b8285d7962d0add6a9f55c63fc045beb677
cd ../../../../ && cd frameworks/base && git fetch https://github.com/PotatoProject/frameworks_base dumaloo-release && git cherry-pick 5db62c3223a698657acafdefda323baa5e773d4c
cd ../../

# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone https://github.com/CyberJalagam/device_realme_RMX1831 -b lineage-18.0 device/realme/RMX1831

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone https://github.com/SparXFusion/android_vendor_realme_RMX1831 -b lineage-18.0 vendor/realme/RMX1831

echo -e "\n Done!\n"

source build/envsetup.sh
lunch lineage_RMX1831-userdebug
export SAKURA_MAINTAINER=JAISHNAVPRASAD
export SKIP_ABI_CHECKS=true
export LAWNCHAIR_OUTPUT=true
make bacon -j8
