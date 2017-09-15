This script takes a hierarchical directory structure as an input. It then does the following things:

1. Extracts all the *.mp3 files to the root directory of the directory structure.
2. Extracts all the other files to `<root>/_other` directory.
3. Removes all the folders except `<root>/_other`.

The result is a directory with all the mp3 songs present in the directory structure and all the other files backed up to `_other` directory.
