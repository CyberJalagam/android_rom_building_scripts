# screen -LS rom bash build.sh

source build/envsetup.sh
lunch lineage_CPH1859-userdebug
mka api-stubs-docs && mka hiddenapi-lists-docs && mka system-api-stubs-docs && mka test-api-stubs-docs && mka bacon
