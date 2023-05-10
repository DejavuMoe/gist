#!/bin/bash

for ipv4 in `cat ips-v4`
do
    sudo ufw delete allow from $ipv4 to any port 80
    sudo ufw delete allow from $ipv4 to any port 443
done

for ipv6 in `cat ips-v6`
do
    sudo ufw delete allow from $ipv6 to any port 80
    sudo ufw delete allow from $ipv6 to any port 443
done