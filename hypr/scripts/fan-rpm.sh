#!/bin/bash

# Aradığın sensör adı
TARGET="asus"

# hwmon dizinlerini tarar
for dir in /sys/class/hwmon/hwmon*; do
  if [[ -f "$dir/name" ]]; then
    name=$(cat "$dir/name")
    if [[ "$name" == "$TARGET" ]]; then
      echo "Bulundu: $dir"
      # Örnek olarak ilk sıcaklık değerini al
      cat "$dir/temp1_input"
      break
    fi
  fi
done
