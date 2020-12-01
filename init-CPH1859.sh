#!/bin/bash
#
# Script to configure device

DEVICE_TREE=""
DEVICE_TREE_BRANCH=""

echo "Enter Device tree link: "
read DEVICE_TREE

echo "Enter Device tree branch: "
read DEVICE_TREE_BRANCH

# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone "$DEVICE_TREE" -b "$DEVICE_TREE_BRANCH" device/oppo/CPH1859

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone https://github.com/CPH1859/proprietary_vendor_oppo_CPH1859 vendor/oppo/CPH1859

# Kernel Tree
echo -e "\n================== Clonning kernel tree ==================\n"
git clone https://github.com/CPH1859/android_kernel_oppo_mt6771 kernel/oppo/CPH1859
echo -e "\n Done!\n"

# Revert an selinux commit
echo -e "\n======================== SeFix ============================\n"
cd external/selinux && git revert --no-edit `git log --oneline | grep "Make an unknown permission an error in CIL" | cut -d' ' -f 1`
