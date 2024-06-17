@echo off
title Lista de Procesos en Ejecución
echo Mostrando todos los procesos en ejecución:
echo.
tasklist /v /fi "STATUS eq running"
echo.
pause
