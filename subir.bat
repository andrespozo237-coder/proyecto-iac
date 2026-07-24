@echo off
echo ==============================================
echo   Subiendo cambios de EVE-NG a GitHub...
echo ==============================================

:: Agregar todos los cambios
git add .

:: Pedir al usuario un mensaje (o usar uno por defecto si lo deja en blanco)
set /p mensaje="Escribe un mensaje para el cambio (o presiona Enter para usar 'Actualizacion automatica'): "
if "%mensaje%"=="" set mensaje=Actualizacion automatica

:: Crear el commit
git commit -m "%mensaje%"

:: Subir a GitHub
echo.
echo Subiendo los archivos...
git push

echo.
echo ==============================================
echo          ¡Proceso Completado! 
echo      GitHub aplicara los cambios en breve.
echo ==============================================
pause
