echo -e "\n=====================================================================================================================================\n"
echo -e "\n=========================================== Android ROM ENVIRONMENT SCRIPT ==========================================================\n"
echo -e "\n=====================================================================================================================================\n"
echo -e "\n=====================================================================================================================================\n"
echo -e "\n============================================// Script Author- JAISHNAV \\============================================================\n"
echo -e "\n=====================================================================================================================================\n"
echo -e "\n=====================================================================================================================================\n"
echo -e "\n=====================================//** Copyright RB INTERNATIONAL NETWORK 2020 **\\===============================================\n"
echo -e "\n=====================================================================================================================================\n"
echo -e "\n=====================================================================================================================================\n"


echo -e "\n======================================= Welcome To The Android ROM Environment Script ===============================================\n"
echo -e "\n=====================================================================================================================================\n"
sleep 5
read -p "Press Y to move forward to the environment setup(RECOMMENDED), Press any other key to move to the full rom environment script " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
     GIT_USERNAME=""
     GIT_MAIL=""
     
     echo "Enter GitHub Username: "
     read GIT_USERNAME

     echo "Enter GitHub Email: "
     read GIT_EMAIL

     # Username
     echo -e "\n================== Adding Username ==================\n"
     git config --global user.name "$GIT_USERNAME"
     echo -e "\n Added your username!\n"

     #Email
     echo -e "\n==================   Adding Email   ==================\n"
     git config --global user.email "$GIT_MAIL"
     echo -e "\n Added your email!\n"

     #List Settings
     echo -e "\n==================   List Settings   ==================\n"
     git config --list
     echo -e "\n==================   Check the configuration, Wait-time 15sec   ==================\n"
     sleep 15
     wget https://raw.githubusercontent.com/akhilnarang/scripts/master/setup/android_build_env.sh
     bash android_build_env.sh
     export USE_CCACHE=1
     export USE_CCACHE_EXEC=$(command -v ccache)
     ccache -M 50G
     export ANDROID_JACK_VM_ARGS="-Xmx15g -Dfile.encoding=UTF-8 -XX:+TieredCompilation"
     read -p "Please press Y to setup gdrive upload configuration, Press any other key to continue without gdrive " -n 1 -r
     if [[ ! $REPLY =~ ^[Yy]$ ]]
     then
         wget https://www.dropbox.com/s/w65lffvkkqvvj93/gdrive?dl=1
         mv gdrive?dl=1 gdrive
         chmod +x gdrive
         ./gdrive list
         echo -e "\n============================================ Installation Done ==============================================================\n"
         echo -e "\n======================================= ©2020 RB INTERNATIONAL NETWORK ======================================================\n"
         exit
                
      fi
        echo -e "\n============================================ Installation Done ==============================================================\n"
        echo -e "\n======================================= ©2020 RB INTERNATIONAL NETWORK ======================================================\n"
        exit
fi
  echo -e "\nWARNING! This is deprecated and is not adviced to use, The script is not stable"
  sleep 10
  chmod +X full_build_script.sh
  bash full_build_script.sh
  read -p "Please press Y to setup gdrive upload configuration, Press any other key to proceed without gdrive  " -n 1 -r
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
      wget https://www.dropbox.com/s/w65lffvkkqvvj93/gdrive?dl=1
      mv gdrive?dl=1 gdrive
      chmod +x gdrive
      ./gdrive list
      echo -e "\n============================================ Installation Done ==============================================================\n"
      echo -e "\n======================================= ©2020 RB INTERNATIONAL NETWORK ======================================================\n"
      exit
  fi
    echo -e "\n============================================ Installation Done ==============================================================\n"
    echo -e "\n======================================= ©2020 RB INTERNATIONAL NETWORK ======================================================\n"
    exit
  
