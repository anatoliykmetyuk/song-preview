#!/usr/bin/env bash

TARGET=$1
OTHER_NAME="_other"
OTHER="$TARGET/$OTHER_NAME"

if [ ! -e "$OTHER" ]; then
  echo 'Creating the directory for the other files'
  mkdir -v "$OTHER"
fi

# Move all the mp3 files to the root directory
# For details of -I, see: https://askubuntu.com/a/487038
echo -e '\nExtracting mp3 files'
find "$TARGET" -type f -name "*.mp3" -print0 | \
  xargs -0I {} mv -v {} "$TARGET"

# Move all the other files present in the directories to the "other" folder
# If the file with the same name exists, backup it with a number
# For details of --backup, see: https://serverfault.com/a/267266
echo -e '\nExtracting other files'
find "$TARGET" -type f -not -name "*.mp3" -print0 | \
  xargs -0I {} gmv -v --backup=t {} "$OTHER"

# Remove all the folders except for _other
echo -e '\nCleaning up the directories'
find "$TARGET"/* -type d -not -name "$OTHER_NAME" -print0 | \
  xargs -0 rm -vr

# Counting the number of songs extracted
echo -e '\nExtraction finished, number of songs extracted:'
find "$TARGET" -type f -name "*.mp3" | wc -l
