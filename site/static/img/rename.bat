@echo off

rem このバッチが存在するフォルダをカレントに
pushd %0\..
cls

for %%A in (*) do call :sub "%%A"
for /d %%i in (*) do (
pushd .
cd %%i
for %%j in (*) do call :sub "%%j"
popd
)

pause
exit

:sub
set fname=%1
set fname1=%fname:download=image%
ren %1 %fname1%
exit /b