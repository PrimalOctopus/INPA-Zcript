@echo off

:: Declare vars
SET inpa-path=C:\EC-APPS\INPA\BIN
SET file=%~nx1
SET fileExt=%~x1
SET fileName=%~n1
SET filePath=%~dps1
SET buildPath=%filePath%.build\%fileName%

::exit 

call .vscode\comp.bat "%~1"

:: Guard statement
IF %ERRORLEVEL% NEQ 0 echo "COMPILATION ERROR" & goto FAILED

cd /D %inpa-path%
INPALOAD.exe "%buildpath%\%fileName%"

GOTO END

:FAILED
echo failed
exit 1

:END
exit 