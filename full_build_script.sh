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
SYNC_COMMAND=""
DT_LINK=""
BRANCH_DT=""
VT_LINK=""
BRANCH_VT=""
CODENAME=""
BRAND_NAME=""

sudo apt-get update;
sudo apt-get -y upgrade;

sudo apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip ccache tree;

mkdir ~/bin;  PATH=~/bin:$PATH;  curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo;  chmod a+x ~/bin/repo;

echo "Enter ROM name: " 
read ROM_NAME

cd ~
mkdir $ROM_NAME
cd $ROM_NAME

echo "Enter GitHub Username: "
read GIT_USERNAME

echo "Enter GitHub Email: "
read GIT_EMAIL

git config --global User.name "$GIT_USERNAME";
git config --global User.email "$GIT_EMAIL";

export USE_CCACHE=1; export USE_CCACHE_EXEC=$(command -v ccache); ccache -M 50G; export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation";

echo "Enter the link of rom manifest: "
read ROM_MANIFEST

echo "Enter the branch: "
read BRANCH_ROM

repo init -u "$ROM_MANIFEST" -b "$BRANCH_NAME";


echo "Enter the core with appropriate command. eg, -c -j6 : "
read SYNC_COMMAND

echo " Syncing repo. This may take a while depending on your internet speed : "

repo sync "$SYNC_COMMAND";

echo "Enter the link of your Device Tree: "
read DT_LINK

echo "Enter the branch of DT: "
read BRANCH_DT

echo "Enter codename: " 
read CODENAME

echo "Enter Brand name: " 
read BRAND_NAME

git clone "$DT_LINK" -b "$BRANCH_DT" device/"$BRAND_NAME"/"$CODENAME";

echo "Enter the link of your Vendor Tree: "
read VT_LINK

echo "Enter the branch of VT: "
read BRANCH_VT

git clone "$VT_LINK" -b "$BRANCH_VT" vendor/"$BRAND_NAME"/"$CODENAME";
read -p "Do you use a low spec server? Please press Y to proceed, press any other key for systems with decent specs" -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    cd ../easy_rom_compiling_script/;
    cp -v build_2.sh ../"$ROM_NAME"
    echo "Everything is setup. nano the build_2.sh according to the rom and device, then use the command- "
    echo "screen -LS rom bash build_2.sh "
    exit
fi

  cd ../easy_rom_compiling_script/;
  cp -v build.sh ../"$ROM_NAME"

  echo "Everything is setup. nano the build.sh according to the rom and use the command- "
  echo "screen -LS rom bash build.sh "
  exit
