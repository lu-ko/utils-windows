:: Watchdog Timer
:: 
:: Detects status of given process. It it is not running then given start program is executed.

@echo off
set TIMEOUT_RUNNING=20
set TIMEOUT_STOPPED=5

if "%~1"=="" goto :usage
if "%~2"=="" goto :usage
set PROCESS_NAME=%1
set PROGRAM=%2
goto loop

:usage
echo Missing arguments!
echo Usage:
echo    watchdog.bat {process-name} {start-program}
echo Example:
echo    watchdog.bat myProcess.exe myStartProgram.exe
goto :eof

:loop
tasklist /FI "IMAGENAME eq %PROCESS_NAME%" /NH | find /I /N "%PROCESS_NAME%" >NUL

if "%ERRORLEVEL%"=="0" (

  echo [%DATE% %TIME%] Process %PROCESS_NAME% is running - Nothing to do with %PROGRAM%.
  timeout %TIMEOUT_RUNNING%

) else (

  echo [%DATE% %TIME%] Process %PROCESS_NAME% is not running! - Executing start program: %PROGRAM%
  start %PROGRAM%
  timeout %TIMEOUT_STOPPED%
)
goto loop
