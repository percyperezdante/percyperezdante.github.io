---
title: "Security"
date: 2024-02-01T10:58:09Z
---

## Networking

- Baasic commands:
```bash
  ifconfig
  ifconfig eth 192.168.2.33  # Change or set IP of eth0
  ifconfig eth 192.168.2.33 netmask 255.255.0.0. broadcast 192.168.2.255  # set or change mask and broadcast

  iwconfig

  # Changing MAC address
  ifconfig eth0 down
  ifconfig eth0 hw ether 00:11:22:33:44:55
  ifconfig eth0 up  

  # DHCP
  dhclient eth0  # retrieve a new IP

  # Scanning DNS
  # --> Get the DNS IP, add ns. "ns"=name server
  dig hackers-arise.com ns 
  # --> Get the mail server, add mx, "mx"=mail exchange
  dig hackers-arise.com mx

  # change your DNS entries. DNS search will be executed in the listed order
  Open /etc/resolv.conf

  # Mapping your own IP
  Open /etc/hosts and map there: 127.0.0.1 myname. Use TABs instead of spaces.
 
```
