#!/bin/bash

# Configuración
step=10 # Paso de ajuste del brillo (10%)

# Verificar si ddcutil está instalado
if ! command -v ddcutil &>/dev/null; then
  echo "Error: ddcutil no está instalado."
  echo "Instálalo con: sudo apt install ddcutil (en Debian/Ubuntu)"
  exit 1
fi

# Mostrar ayuda si no hay parámetros
if [ $# -lt 1 ]; then
  echo "Uso: $0 [up|down]"
  echo "  up      - Aumenta el brillo en $step%"
  echo "  down    - Disminuye el brillo en $step%"
  echo ""
  echo "Ejemplo: $0 1 up    # Aumenta brillo en display 1"
  exit 1
fi

action=$1

monitor=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true)')
monitor_model=$(jq -r .model <<<"$monitor")
monitor_id=$(jq -r .id <<<"$monitor")

# Obtener el brillo actual
current_brightness=$(ddcutil --model="$monitor_model" getvcp 10 | awk '{print $9}' | cut -d ',' -f1 | tr -d '%')

# Verificar si se obtuvo el brillo correctamente
if [ -z "$current_brightness" ] || ! [[ "$current_brightness" =~ ^[0-9]+$ ]]; then
  echo "Error: No se pudo obtener el brillo actual de la pantalla $monitor_model."
  echo "Posibles causas:"
  echo "1. El número de display es incorrecto"
  echo "2. La pantalla no soporta control DDC/CI"
  echo "3. Problemas de permisos con ddcutil"
  exit 1
fi

# Función para ajustar el brillo
adjust_brightness() {
  local new_brightness=$1
  local image="brightness_high"

  # Asegurarse de que el brillo esté entre 0 y 100
  if [ "$new_brightness" -lt 0 ]; then
    new_brightness=0
  elif [ "$new_brightness" -gt 100 ]; then
    new_brightness=100
  fi

  if [ "$new_brightness" -le 33 ]; then
    image="brightness_low"
  elif [ "$new_brightness" -le 66 ]; then
    image="brightness_medium"
  fi

  brightness_float=$(awk "BEGIN {printf \"%.2f\", $new_brightness/100}")

  # Aplicar el nuevo brillo
  ddcutil --model="$monitor_model" setvcp 10 "$new_brightness"
  avizo-client --image-resource="$image" --progress="$brightness_float" --monitor="$monitor_id"
}

# Manejar los argumentos
case "$action" in
up)
  adjust_brightness $((current_brightness + step))
  ;;
down)
  adjust_brightness $((current_brightness - step))
  ;;
*)
  echo "Error: Acción no válida '$action'"
  echo "Acciones válidas: up, down"
  exit 1
  ;;
esac
