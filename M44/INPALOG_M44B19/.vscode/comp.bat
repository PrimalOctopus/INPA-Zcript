@echo off

:: Declare vars
SET inpa-path=C:\EC-APPS\INPA\BIN
SET file=%~nx1
SET fileExt=%~x1
SET fileName=%~n1
SET filePath=%~dps1
SET buildPath=%filePath%.build\%fileName%

:: Guard statements
IF [%file%] == [] echo "Missing argument, usage comp.bat <script.ips>" & GOTO FAILED
IF NOT %fileExt% == .ips echo "Invalid file extension '%fileExt%', must be '.ips'" & GOTO FAILED
IF NOT EXIST %file% echo "File %file% does not exist" & GOTO FAILED
::IF EXIST %inpa-path%\.build\%fileName%.ips echo "%inpa-path%\.build\%fileName%.ips already exists, delete/backup the file as appropriate" & GOTO FAILED
::IF EXIST %inpa-path%\.build\%fileName%.ipo echo "%inpa-path%\.build\%fileName%.ipo already exists, delete/backup the file as appropriate" & GOTO FAILED
::IF EXIST %inpa-path%\.build\%fileName%.ini echo "%inpa-path%\.build\%fileName%.ini already exists, delete/backup the file as appropriate" & GOTO FAILED

:: Create folders for build if needed
IF NOT EXIST .build mkdir .build
IF NOT EXIST .build\%fileName% mkdir .build\%fileName%
::IF NOT EXIST %inpa-path%\.build mkdir %inpa-path%\.build

echo compiling %file%
::copy %file% %inpa-path%\.build\ > NUL
copy %file% %buildPath% > NUL
pushd %inpa-path%

:: Compile
INPACOMP.exe %buildPath%\%file% -B %buildPath%\%fileName%.log
popd
cd %buildPath%

if NOT EXIST %fileName%.ipo echo "Compilation failed, .ipo not generated" & GOTO COMPFAILED
if NOT EXIST %fileName%.ini echo "Compilation failed, .ini not generated" & GOTO COMPFAILED
if NOT EXIST %fileName%.log echo "Compilation failed, .log not generated" & GOTO COMPFAILED

:: Move built files to project build folder
move %fileName%.ipo %fileName%.IPO > NUL
type %fileName%.log"

goto END

:COMPFAILED
echo Compilation failed
type %fileName%.log
exit /B 1

:FAILED
echo Build process failed
exit /B 2

:END
exit /B 0