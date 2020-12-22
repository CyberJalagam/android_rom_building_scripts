#!/bin/bash

echo "<<<<< by hitesh920 >>>>>"

FILE_NAME_WITH_EXTENSION=""
FILE_LOCATION_WITH_EXTENSION=""

echo "enter full rom name with extension"
read FILE_NAME_WITH_EXTENSION

echo "Enter full dir of rom zip including extension: "
read FILE_LOCATION_WITH_EXTENSION

curl https://bashupload.com/"$FILE_NAME_WITH_EXTENSION" --data-binary @"$FILE_LOCATION_WITH_EXTENSION"

echo "Operation sucessful!, file has been uploaded"

echo "<<<<< by hitesh920 >>>>>"
