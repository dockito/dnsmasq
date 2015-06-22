#!/bin/bash

set -e

if [ "$#" -eq 0 ]; then
  cp -f /etc/dnsmasq.conf.orig /etc/dnsmasq.conf
  echo "nameserver $DOCKITO_DNS" > /etc/resolv.conf
  echo "address=/$DOCKITO_HOST/$DOCKITO_IP" >> /etc/dnsmasq.conf
  echo "log-queries" >> /etc/dnsmasq.conf

  exec dnsmasq -d
fi

exec "$@"
