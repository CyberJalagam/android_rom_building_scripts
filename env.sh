wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh
bash android_build_env.sh
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get -y update
sudo apt-get install -y python3.6
export USE_CCACHE=1
export USE_CCACHE_EXEC=$(command -v ccache)
ccache -M 50G
export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
