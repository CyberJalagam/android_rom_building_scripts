#!/bin/bash

echo "<<<<< by hitesh920 >>>>>"

FILE_NAME_WITH_EXTENSION=""
FILE_LOCATION_WITH_EXTENSION=""

echo "Enter full rom name with extension"
echo "eg, xyz.zip"
read FILE_NAME_WITH_EXTENSION

echo "Enter full dir of rom file including extension"
echo "eg, /home/ubuntu/sakura/out/target/product/CPH1859/xyz.zip"
read FILE_LOCATION_WITH_EXTENSION

curl https://bashupload.com/"$FILE_NAME_WITH_EXTENSION" --data-binary @"$FILE_LOCATION_WITH_EXTENSION"

echo "Operation sucessful!, file has been uploaded"

echo "<<<<< by hitesh920 >>>>>"
