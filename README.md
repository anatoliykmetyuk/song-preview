# Purpose
This script takes a hierarchical directory structure as an input. It then does the following things:

1. Extracts all the *.mp3 files to the root directory of the directory structure.
2. Extracts all the other files to `<root>/_other` directory.
3. Removes all the folders except `<root>/_other`.

The result is a directory with all the mp3 songs present in the directory structure and all the other files backed up to `_other` directory.

## Further Processing
The output is intended to be further used to trim the extracted songs to the form of previews. The intention is to make it easy to quickly preview large sets of songs to identify the good ones. The idea is that it is faster to listen to a 40 second song fragment than the full 5 minutes of the song.

### Required Capabilities: Trimming
The following capabilities are required during the further processing:

1. Batch trimming of mp3 files
1.1. Drag-n-Drop specification of a batch of files to process (or any other fast way of specification).
1.2. Specification of a time frame to extract (e.g. from 0:40 to 1:20).
1.3. Automatic trimming of the specified files with the output with unchanged names to a specified folder.

One software that has all the specified capabilities is [MP3 Trimmer for Mac](http://deepniner.net/mp3trimmer/).

## Usage of the content
After you have extracted the mp3 files and generated their previews, you can listen to the previews in sequence. You can then note the names of the songs you liked. Due to the Capability (1.3) of the trimming software, you will be able to easily find the full version of that song, because it will have the same name as the preview.

### Required Capabilities: Playback
The following are the capabilities required for the playback software:

1. Sequential playback of a batch of mp3 files.
2. User should be able to mark mp3 files they liked. These should be exportable to a text file. This file needs to contain the names of the songs with their extensions, a name per line. The file should end with a line break.

Any major player should be able of (1). As for (2), you can use a text editor where you copy-paste the file name from the player (obviously it should allow you to copy the name).

# Intended usage
## Extracting mp3 files
1. Create the directory where you are going to store the batch. Copy the directory structure containing your songs to that directory. We will call this directory `$BATCH`.
2. Run `./extract_mp3.sh $BATCH`.

## Further Processing
1. Create a folder where you will store the previews of the songs: `mkdir $ROOT/_Preview` (underscore at the beginning guarantees that it will appear at the top when sorted).
2. Specify all the extracted mp3 files withing the trimming software using Trimming Capability (1.1).
3. Set the time frame you wish to extract with Capability (1.2) (a good one seems to be 0:40-1:20).
4. Perform the trimming using Capability (1.3) with the output to the directory created in (1).

## Usage of the content
1. Listen to the generated previews via Playback Capability (1).
2. Make notes of the songs you like via Capability (2). We will refer to this text file as `$LIST`.
3. Call `./favorites.sh $BATCH $LIST`. This will move your favorite songs to `$BATCH/_Favorites`.
