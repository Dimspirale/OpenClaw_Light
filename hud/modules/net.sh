#!/usr/bin/env bash

PING=$(ping -c 1 8.8.8.8 2>/dev/null | awk -F'time=' '/time=/{print $2}' | cut -d' ' -f1)
IFACE=$(ip route | awk '/default/ {print $5}')

if [ -z "$PING" ]; then
  echo -e "NET : \e[31mOFFLINE\e[0m"
else
  echo -e "NET : \e[32m${PING}ms\e[0m (${IFACE})"
fi
