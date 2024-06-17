@echo off
title Enojon.Bat by Ema-prowler  -_-"
cd c:\windows\System32

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
echo Presione Enter para cerrar los procesos mostrados (Escape para cancelar)...

REM Capturar la tecla presionada por el usuario
set "choice="
set /p "choice=Presione Enter para continuar o Escape para cancelar: "

REM Verificar la opción seleccionada por el usuario
if "%choice%"=="e" (
    echo Operación cancelada por el usuario.
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


pause
