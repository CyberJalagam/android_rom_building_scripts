set -e
set -o pipefail


if [ `whoami` == 'root' ]
  then 
	echo "Please don't run this script as a root user"
	echo "Exiting..."
	exit
fi

GIT_USERNAME=""
GIT_EMAIL=""
ROM_NAME=""
ROM_MANIFEST=""
BRANCH_ROM=""
DT_LINK=""
BRANCH_DT=""
VT_LINK=""
BRANCH_VT=""
CODENAME=""
BRAND_NAME=""

wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh
bash android_build_env.sh

echo "Enter ROM name (used in DT): " 
read ROM_NAME

cd ~
mkdir $ROM_NAME
cd $ROM_NAME

echo "Enter GitHub Username: "
read GIT_USERNAME

echo "Enter GitHub Email: "
read GIT_EMAIL

git config --global User.name "$GIT_USERNAME"
git config --global User.email "$GIT_EMAIL"

export USE_CCACHE=1
export USE_CCACHE_EXEC=$(command -v ccache)
ccache -M 50G
export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"

echo "Enter the link of rom manifest: "
read ROM_MANIFEST

echo "Enter the branch: "
read BRANCH_ROM

repo init --depth=1 -u "$ROM_MANIFEST" -b "$BRANCH_NAME"

echo " Syncing repo. This may take a while depending on your internet speed : "

repo sync -j$(nproc --all)

echo "Enter the link of your Device Tree: "
read DT_LINK

echo "Enter the branch of DT: "
read BRANCH_DT

echo "Enter codename: " 
read CODENAME

echo "Enter Brand name: " 
read BRAND_NAME

git clone "$DT_LINK" -b "$BRANCH_DT" device/"$BRAND_NAME"/"$CODENAME"

echo "Enter the link of your Vendor Tree: "
read VT_LINK

echo "Enter the branch of VT: "
read BRANCH_VT

git clone "$VT_LINK" -b "$BRANCH_VT" vendor/"$BRAND_NAME"/"$CODENAME"

source build/envsetup.sh
lunch "$ROM_NAME"_"$CODENAME"-userdebug
make bacon -j$(nproc --all)
