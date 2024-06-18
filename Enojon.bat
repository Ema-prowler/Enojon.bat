@echo off
title Enojon.Bat by Ema-prowler -_-"
cd /d c:\windows\System32

REM Mostrar los procesos que se van a cerrar
echo Procesos que se van a cerrar:
echo.

for /f "skip=3 tokens=1" %%i in ('TASKLIST /FI "USERNAME eq %userdomain%\%username%" /FI "STATUS eq running"') do (
    if not "%%i"=="svchost.exe" (
        if not "%%i"=="cmd.exe" (
            if not "%%i"=="tasklist.exe" (
                echo %%i
            )
        )
    )
)

REM Preguntar al usuario si desea continuar con el cierre
echo.
echo Presione Y para cerrar los procesos mostrados o N para cancelar...

REM Esperar a que el usuario presione Y o N
set "tecla="
choice /c yn /n /m "Presione 'Y' para continuar o 'N' para cancelar: "

REM Verificar la tecla presionada
if errorlevel 2 (
    echo Operacion cancelada por el usuario.
) else (
    echo Cerrando procesos...
    REM Código para cerrar los procesos
    for /f "skip=3 tokens=1" %%i in ('TASKLIST /FI "USERNAME eq %userdomain%\%username%" /FI "STATUS eq running"') do (
        if not "%%i"=="svchost.exe" (
            if not "%%i"=="cmd.exe" (
                if not "%%i"=="tasklist.exe" (
                    taskkill /f /im "%%i"
                )
            )
        )
    )
)

pause
