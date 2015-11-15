:: VLC recorder - Start script
:: 
:: You can record any stream (video, audio) from any location (network, local file, etc.) that is
:: supported in VLC media player to static file in MP4 format.

@echo off

:: Set absolute path to your VLC binary file
set VLC_EXE="C:\Program Files\VLC\vlc.exe"

:: Set URL of input stream
set INPUT_URL="https://www.youtube.com/watch?v=GQe3JxJHpxQ"
:: set INPUT_URL="udp://@239.194.0.45:6045"
:: set INPUT_URL="M:\path\to\media\folder\my_music.mp3"

:: Set absolute path to destination folder
set OUTPUT_DIR=C:\tmp\vlc-output-folder

:: Set prefix of output file
set OUTPUT_FILE_PREFIX=my_output_file

:: Determining suffix of output file
For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c-%%a-%%b)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo Recording to file: %OUTPUT_DIR%\%OUTPUT_FILE_PREFIX%_%mydate%_%mytime%.mp4"

:: Recording
%VLC_EXE% %INPUT_URL% :sout=#duplicate{dst=std{access=file,dst="%OUTPUT_DIR%\%OUTPUT_FILE_PREFIX%_%mydate%_%mytime%.mp4"}}
