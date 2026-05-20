#!/usr/bin/env bash

# CPU bargraph (stealth mode)

LOAD=$(awk '{print $1}' /proc/loadavg)
CORES=$(nproc)
PERCENT=$(echo "$LOAD $CORES" | awk '{printf "%.0f", ($1/$2)*100}')

# Couleur douce
if [ "$PERCENT" -lt 40 ]; then
  COLOR="\e[32m"   # vert doux
elif [ "$PERCENT" -lt 70 ]; then
  COLOR="\e[33m"   # ambre
else
  COLOR="\e[31m"   # rouge doux
fi

# Bargraph
BAR=""
for i in $(seq 1 20); do
  if [ $i -le $((PERCENT/5)) ]; then
    BAR="${BAR}█"
  else
    BAR="${BAR}░"
  fi
done

echo -e "CPU : ${COLOR}${BAR}\e[0m ${PERCENT}%"
