#!/bin/bash
#
# Script to configure device

DEVICE_TREE=""
DEVICE_TREE_BRANCH=""

BRAND=""
CODENAME=""

VENDOR_TREE=""
VENDOR_TREE_BRANCH=""

KERNEL_TREE=""
KERNEL_TREE_BRANCH=""



echo "Enter codename: "
read CODENAME

echo "Enter Brand: "
read BRAND

echo "Enter Device tree link: "
read DEVICE_TREE

echo "Enter Device tree branch: "
read DEVICE_TREE_BRANCH

echo "Enter Vendor tree link: "
read VENDOR_TREE

echo "Enter Vendor tree branch: "
read VENDOR_TREE_BRANCH

echo "Enter Kernel tree link: "
read KERNEL_TREE

echo "Enter Kernel tree branch: "
read KERNEL_TREE_BRANCH

# Device tree
echo -e "\n================== Clonning device tree ==================\n"
git clone "$DEVICE_TREE" -b "$DEVICE_TREE_BRANCH" device/"$BRAND"/"$CODENAME"

# Vendor Tree
echo -e "\n================== Clonning vendor tree ==================\n"
git clone "$VENDOR_TREE" -b "$VENDOR_TREE_BRANCH" vendor/"$BRAND"/"$CODENAME"

# Kernel Tree
echo -e "\n================== Clonning kernel tree ==================\n"
git clone "$KERNEL_TREE" -b "$KERNEL_TREE_BRANCH" kernel/"$BRAND"/"$CODENAME"

echo -e "\n Done!\n"
