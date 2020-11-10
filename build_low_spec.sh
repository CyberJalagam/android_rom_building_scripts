source build/envsetup.sh
lunch <build>_<codename>-userdebug
mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && mka bacon -j$(nproc --all)
