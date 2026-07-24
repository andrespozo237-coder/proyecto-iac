@echo off
setlocal EnableDelayedExpansion

echo ==============================================
echo       HISTORIAL RECIENTE DE CAMBIOS
echo ==============================================
:: Mostrar los ultimos 7 cambios
git log --oneline -n 7

echo.
echo ==============================================
echo Escribe el CODIGO (ej. be89442) del cambio que 
echo quieres DESHACER y presiona Enter.
echo (Para cancelar, solo cierra esta ventana)
echo ==============================================
set /p commit="Codigo a deshacer: "

if "%commit%"=="" (
    echo.
    echo No ingresaste ningun codigo. Cancelando...
    pause
    exit /b
)

echo.
echo Deshaciendo el cambio %commit%...
git revert %commit% --no-edit

:: Verificar si el revert fue exitoso
if %errorlevel% neq 0 (
    echo.
    echo Ocurrio un error al intentar deshacer. Es posible que haya conflictos.
    pause
    exit /b
)

echo.
echo Subiendo la restauracion a GitHub para actualizar EVE-NG...
git push

echo.
echo ==============================================
echo   ¡Restauracion completada exitosamente!
echo   GitHub aplicara el arreglo en breve.
echo ==============================================
pause
