source build/envsetup.sh
lunch <build>_<codename>-userdebug
mka bacon -j$(nproc --all)
