#!/usr/bin/env bash

# GPU monitor (WSL + Windows bridge)

GPU_INFO=$(nvidia-smi --query-gpu=name,utilization.gpu,memory.used,memory.total --format=csv,noheader 2>/dev/null)

if [ -z "$GPU_INFO" ]; then
  echo -e "GPU : \e[31mNon détecté\e[0m"
  exit 0
fi

NAME=$(echo "$GPU_INFO" | awk -F',' '{print $1}')
UTIL=$(echo "$GPU_INFO" | awk -F',' '{print $2}' | tr -d ' %')
USED=$(echo "$GPU_INFO" | awk -F',' '{print $3}' | tr -d ' MiB')
TOTAL=$(echo "$GPU_INFO" | awk -F',' '{print $4}' | tr -d ' MiB')
PERCENT=$((100 * USED / TOTAL))

# Couleur stealth
if [ "$UTIL" -lt 40 ]; then COLOR="\e[32m"
elif [ "$UTIL" -lt 70 ]; then COLOR="\e[33m"
else COLOR="\e[31m"; fi

BAR=""
for i in $(seq 1 20); do
  if [ $i -le $((UTIL/5)) ]; then BAR="${BAR}█"
  else BAR="${BAR}░"; fi
done

echo -e "GPU : ${COLOR}${BAR}\e[0m ${UTIL}%  (${USED}/${TOTAL} MiB)"
