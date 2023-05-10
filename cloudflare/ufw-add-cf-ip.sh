#!/bin/bash

for ipv4 in `curl -s https://www.cloudflare.com/ips-v4 | tee ips-v4`
do
    sudo ufw allow from $ipv4 to any port 80
    sudo ufw allow from $ipv4 to any port 443
done

for ipv6 in `curl -s https://www.cloudflare.com/ips-v6 | tee ips-v6`
do
    sudo ufw allow from $ipv6 to any port 80
    sudo ufw allow from $ipv6 to any port 443
done