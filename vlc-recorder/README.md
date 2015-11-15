# VLC recorder

---------------------------------------------------------

## About:

These scripts can be used to record any stream (video, audio) from any location (network, local file, etc.) that is supported in [VLC media player](http://www.videolan.org/) to static file in MP4 format.

## Usage:

Simply edit variables in **vlc_start.bat** script to appropriate values and run this script. Please verify if you can open stream in VLC at first (simply VLC -> Media -> Open ... ).

## Examples:

* Recording from UDP network stream:
  *```
set INPUT_URL="udp://@239.194.0.45:6045"
```

* Recording from YouTube:
  *```
set INPUT_URL="https://www.youtube.com/watch?v=GQe3JxJHpxQ"
```

* Recording from local file:
  *```
set INPUT_URL="M:\path\to\media\folder\my_music.mp3"
```

## Hint:

If you want to record some network stream from/to specific datetime (e.g. sport match), just schedule execution of these 2 batch scripts in Windows.
