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
cd && mkdir sakura
repo init -u git://github.com/ProjectSakura/android.git -b 11
repo sync --current-branch --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune -j8

# Revert an selinux commit
echo -e "\n======================== SeFix ============================\n"
cd external/selinux && git revert --no-edit `git log --oneline | grep "Make an unknown permission an error in CIL" | cut -d' ' -f 1`

# Add some changes to source for hotspot fix
cd ../../ && cd frameworks/opt/net/wifi && git fetch https://github.com/PotatoProject/frameworks_opt_net_wifi dumaloo-release && git cherry-pick 88773b8285d7962d0add6a9f55c63fc045beb677
cd ../../../../ && cd frameworks/base && git fetch https://github.com/PotatoProject/frameworks_base dumaloo-release && git cherry-pick 5db62c3223a698657acafdefda323baa5e773d4c
cd ../../


# THIS IS TEMPORARY
# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone https://github.com/CPH1859/android_device_oppo_CPH1859 -b lineage-18.0-ims device/oppo/CPH1859
cd device/oppo/CPH1859
git fetch https://github.com/CyberJalagam/ProjectSakura_CPH1859 eleven && git cherry-pick 35e6655c5e0526644e54d3595cc5923de0a04758 && git cherry-pick 8f34cc23293b5456ca989de4b1de7f05422593fd
cd ../../../
# THIS IS TEMPORARY

cp -r ../sakura-priv vendor

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone https://github.com/CPH1859/proprietary_vendor_oppo_CPH1859 vendor/oppo/CPH1859

# Kernel Tree
echo -e "\n================== Clonning kernel tree ==================\n"
git clone https://github.com/CPH1859/android_kernel_oppo_mt6771 kernel/oppo/mt6771
echo -e "\n Done!\n"

source build/envsetup.sh
lunch lineage_CPH1859-userdebug
export SAKURA_MAINTAINER=JAISHNAVPRASAD
export SKIP_ABI_CHECKS=true
export SAKURA_OFFICIAL=true
export LAWNCHAIR_OUTPUT=true
make bacon -j8
