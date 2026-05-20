#!/usr/bin/env bash

echo "Risques :"

# CPU
CPU_LOAD=$(awk '{print $1}' /proc/loadavg)
CORES=$(nproc)
CPU_PERCENT=$(echo "$CPU_LOAD $CORES" | awk '{printf "%.0f", ($1/$2)*100}')
if [ "$CPU_PERCENT" -gt 85 ]; then
  echo -e "   CPU : \e[31mSurcharge\e[0m"
elif [ "$CPU_PERCENT" -gt 60 ]; then
  echo -e "   CPU : \e[33mCharge élevée\e[0m"
else
  echo -e "   CPU : \e[32mOK\e[0m"
fi

# RAM
USED=$(free -m | awk '/Mem:/ {print $3}')
TOTAL=$(free -m | awk '/Mem:/ {print $2}')
RAM_PERCENT=$((100 * USED / TOTAL))
if [ "$RAM_PERCENT" -gt 85 ]; then
  echo -e "   RAM : \e[31mSaturation\e[0m"
elif [ "$RAM_PERCENT" -gt 60 ]; then
  echo -e "   RAM : \e[33mCharge élevée\e[0m"
else
  echo -e "   RAM : \e[32mOK\e[0m"
fi

# NET
PING=$(ping -c 1 8.8.8.8 2>/dev/null | awk -F'time=' '/time=/{print $2}' | cut -d' ' -f1)
if [ -z "$PING" ]; then
  echo -e "   NET : \e[31mOFFLINE\e[0m"
elif (( $(echo "$PING > 80" | bc -l) )); then
  echo -e "   NET : \e[33mLatence élevée\e[0m"
else
  echo -e "   NET : \e[32mOK\e[0m"
fi

# GPU
GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader 2>/dev/null | tr -d ' %')
if [ -z "$GPU_UTIL" ]; then
  echo -e "   GPU : \e[31mNon détecté\e[0m"
elif [ "$GPU_UTIL" -gt 85 ]; then
  echo -e "   GPU : \e[31mSurcharge\e[0m"
elif [ "$GPU_UTIL" -gt 60 ]; then
  echo -e "   GPU : \e[33mCharge élevée\e[0m"
else
  echo -e "   GPU : \e[32mOK\e[0m"
fi
