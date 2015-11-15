:: File and line counter for OS Windows
::
:: Simply copy this batch file to appropriate folder and run it.

@echo off
setlocal
set "format= [-10] | [-12] | [-12]"
set /a numFiles=0
set /a numLines=0

echo.
echo.Number of lines in different types of files:
echo.============================================
call :format "%format%" "extension" "# files" "# lines"
echo.--------------------------------------------
call:countFilesAndLines *.txt numFiles numLines
call:countFilesAndLines *.md numFiles numLines
call:countFilesAndLines *.bat numFiles numLines
call:countFilesAndLines *.sh numFiles numLines
call:countFilesAndLines *.java numFiles numLines
call:countFilesAndLines *.sql numFiles numLines
call:countFilesAndLines *.xml numFiles numLines
call:countFilesAndLines *.html numFiles numLines
echo.--------------------------------------------
call :format "%format%" "sum" %numFiles% %numLines%
echo.&pause&goto:eof


:countFilesAndLines
set /a filesCount=0
set /a linesCount=0
for /r . %%f in (%~1) do (
  set /a filesCount += 1
  for /f %%n in ('type "%%f"^|find /v /c "~~~"') do set /a linesCount += %%n
)
call :format "%format%" %%~1 %filesCount% %linesCount%
set /a %~2 += filesCount
set /a %~3 += linesCount
exit /b


:format fmt [str1] [str2]...
setlocal disableDelayedExpansion
set "fmt=%~1"
set "line="
set "space=                                                                                                    "
setlocal enableDelayedExpansion
for %%n in (^"^

^") do for /f "tokens=1,2 delims=[" %%a in (".!fmt:]=%%~n.!") do (
  if "!!" equ "" endlocal
  set "const=%%a"
  call set "subst=%%~2%space%%%~2"
  setlocal enableDelayedExpansion
  if %%b0 geq 0 (set "subst=!subst:~0,%%b!") else set "subst=!subst:~%%b!"
  for /f delims^=^ eol^= %%c in ("!line!!const:~1!!subst!") do (
    endlocal
    set "line=%%c"
  )
  shift /2
)
setlocal enableDelayedExpansion
echo(!line!
exit /b