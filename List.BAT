@echo off
title Lista de Procesos en Ejecucion by Ema-prowler  -_-"
echo Mostrando todos los procesos en ejecucion:
echo.
tasklist /v /fi "STATUS eq running"
echo.
pause
