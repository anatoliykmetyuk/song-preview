#!/usr/bin/env bash

TARGET=$1
FAVORITES_LIST=$2

FAVORITES_NAME="_Favorites"
FAVORITES="$TARGET/$FAVORITES_NAME"

if [ ! -e "$FAVORITES" ]; then
  echo 'Creating the directory for the favorite songs'
  mkdir -v "$FAVORITES"
fi

echo -e '\nExtracting favorite songs'
cat "$FAVORITES_LIST" | while read p; do
  find "$TARGET" -type f -name "$p" -not -path "$TARGET/_Preview/*" -print0 | \
    xargs -0I {} gmv -v --backup=t "{}" "$FAVORITES"
done
