#!/bin/bash

# Configuración
STEP=10 # Paso de ajuste del brillo (10%)

# Verificar si ddcutil está instalado
if ! command -v ddcutil &>/dev/null; then
  echo "Error: ddcutil no está instalado."
  echo "Instálalo con: sudo apt install ddcutil (en Debian/Ubuntu)"
  exit 1
fi

# Mostrar ayuda si no hay parámetros
if [ $# -lt 1 ]; then
  echo "Uso: $0 [up|down]"
  echo "  up      - Aumenta el brillo en $STEP%"
  echo "  down    - Disminuye el brillo en $STEP%"
  echo ""
  echo "Ejemplo: $0 1 up    # Aumenta brillo en display 1"
  exit 1
fi

MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')

ACTION=$1

if [ "$MONITOR" = "DP-1" ]; then
  DISPLAY=2
else
  DISPLAY=1
fi

# Obtener el brillo actual
CURRENT_BRIGHTNESS=$(ddcutil --display "$DISPLAY" getvcp 10 | awk '{print $9}' | cut -d ',' -f1 | tr -d '%')

# Verificar si se obtuvo el brillo correctamente
if [ -z "$CURRENT_BRIGHTNESS" ] || ! [[ "$CURRENT_BRIGHTNESS" =~ ^[0-9]+$ ]]; then
  echo "Error: No se pudo obtener el brillo actual de la pantalla $DISPLAY."
  echo "Posibles causas:"
  echo "1. El número de display es incorrecto"
  echo "2. La pantalla no soporta control DDC/CI"
  echo "3. Problemas de permisos con ddcutil"
  exit 1
fi

# Función para ajustar el brillo
adjust_brightness() {
  local new_brightness=$1

  # Asegurarse de que el brillo esté entre 0 y 100
  if [ "$new_brightness" -lt 0 ]; then
    new_brightness=0
  elif [ "$new_brightness" -gt 100 ]; then
    new_brightness=100
  fi

  BRIGHTNESS_FLOAT=$(awk "BEGIN {printf \"%.1f\", $new_brightness/100}")

  # Aplicar el nuevo brillo
  ddcutil --display $DISPLAY setvcp 10 "$new_brightness"
  swayosd-client --custom-progress="$BRIGHTNESS_FLOAT" --custom-icon=weather-clear
}

# Manejar los argumentos
case "$ACTION" in
up)
  adjust_brightness $((CURRENT_BRIGHTNESS + STEP))
  ;;
down)
  adjust_brightness $((CURRENT_BRIGHTNESS - STEP))
  ;;
*)
  echo "Error: Acción no válida '$ACTION'"
  echo "Acciones válidas: up, down"
  exit 1
  ;;
esac
