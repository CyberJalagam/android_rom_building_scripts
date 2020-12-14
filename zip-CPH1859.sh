ROM_NAME=""

ls
echo "Enter FULL rom name including extension: " 
read ROM_NAME

mkdir working-dir
cp -v "$ROM_NAME" working-dir
cd working-dir && unzip "$ROM_NAME"
rm -rf "$ROM_NAME"
rm -rf boot.img
wget https://github.com/CyberJalagam/android_rom_building_scripts/blob/master/prebuilt-device-specific/CPH1859/boot.img?raw=true
mv boot.img?raw=true boot.img
zip -r "$ROM_NAME" ./*
echo "Operation sucessful!, Full path of the modified rom given below"
realpath "$ROM_NAME"
