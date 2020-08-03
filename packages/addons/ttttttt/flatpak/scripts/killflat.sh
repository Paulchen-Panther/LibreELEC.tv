#!/bin/sh

. /etc/profile

for PID in "$(flatpak ps | grep -i $1 | awk '{print $1}')"; do
  test -n "${PID}" && flatpak kill ${PID}
done
