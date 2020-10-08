wget https://raw.githubusercontent.com/CyberJalagam/scripts/master/gitsetup.sh
bash gitsetup.sh
wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh
bash android_build_env.sh
export USE_CCACHE=1
export USE_CCACHE_EXEC=$(command -v ccache)
ccache -M 50G
export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
wget https://www.dropbox.com/s/w65lffvkkqvvj93/gdrive?dl=1
mv gdrive?dl=1 gdrive
chmod +x gdrive
./gdrive list
