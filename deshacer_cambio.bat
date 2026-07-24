@echo off
setlocal EnableDelayedExpansion

:menu
cls
echo ==============================================
echo       HISTORIAL RECIENTE DE CAMBIOS
echo ==============================================
:: Mostrar los ultimos 7 cambios
git log --oneline -n 7

echo.
echo ==============================================
echo Escribe el CODIGO (ej. a0a9194) del cambio que 
echo quieres DESHACER y presiona Enter.
echo.
echo Para SALIR, simplemente escribe: salir
echo ==============================================
set /p commit="Codigo a deshacer (o 'salir'): "

if /i "%commit%"=="salir" (
    exit /b
)

if "%commit%"=="" (
    echo.
    echo No ingresaste ningun codigo. Intenta de nuevo...
    pause
    goto menu
)

echo.
echo Deshaciendo el cambio %commit%...
git revert %commit% --no-edit

:: Verificar si el revert fue exitoso
if %errorlevel% neq 0 (
    echo.
    echo [!] Ocurrio un conflicto porque ese cambio antiguo choca con uno mas reciente.
    echo [!] Cancelando la operacion para no dañar tus archivos...
    git revert --abort
    pause
    goto menu
)

echo.
echo Subiendo la restauracion a GitHub para actualizar EVE-NG...
git push

echo.
echo ==============================================
echo   ¡Restauracion completada exitosamente!
echo   GitHub aplicara el arreglo en breve.
echo ==============================================
echo Presiona cualquier tecla para hacer OTRO cambio...
pause >nul
goto menu
