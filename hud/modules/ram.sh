#!/usr/bin/env bash

USED=$(free -m | awk '/Mem:/ {print $3}')
TOTAL=$(free -m | awk '/Mem:/ {print $2}')
PERCENT=$((100 * USED / TOTAL))

if [ "$PERCENT" -lt 40 ]; then
  COLOR="\e[32m"
elif [ "$PERCENT" -lt 70 ]; then
  COLOR="\e[33m"
else
  COLOR="\e[31m"
fi

BAR=""
for i in $(seq 1 20); do
  if [ $i -le $((PERCENT/5)) ]; then
    BAR="${BAR}█"
  else
    BAR="${BAR}░"
  fi
done

echo -e "RAM : ${COLOR}${BAR}\e[0m ${PERCENT}%"
