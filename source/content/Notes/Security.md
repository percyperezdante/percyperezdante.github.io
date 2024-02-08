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

## Scheduling

```bash
  at 7:20pm
  at 7:20pm June 25
  at  now + 20 minutes
  at  now + 2 days
  at  now + 2 weeks
  at 3:00am 06/25/2023

```

## Process
```basg
  nice:  The nice command is used to start a process with a specified priority. The priority ranges from -20 to 19, where -20 is the highest priority and 19 is the lowest
  nice priority command
  nice echo "HI "      # default priority
  nice -n 10 echo "HI "      # 10 means lower priority, this will allow other processes to get more CPU time.
  nice -n -15 echo "hi"      # -15 means higher priority. This process is allow to take more resources.

  renice : The renice command is used to alter the priority of an already running process. It allows you to increase or decrease the priority of a process.
  renice priority -p PID
  renice priority -g process_group
  renice +5 -p 12345     # the priority of the process with PID 12345 is increased by 5.


  fg;   is used to bring a background process into the foreground, allowing it to receive input from the terminal.
  
  bg: command is used to start a suspended (stopped) process in the background. It allows the process to continue running but not receive input from the terminal.

  jobs; view a list of jobs and their status
```

## Filesystem 
- Directories
```bash
    /dev  devices, 
          sda1,sda2,sda3, sdb, sdb1 are the hard drives.
    Type of device: Use ls -lte /dev
          Character devices:  device which permission start with "c", linked to external devices that collects character by character information, such as keyboards, and mice.
          Block devices:  Permissions start with "b". linked to devices that required higher speed data throughtput such as harddrives, DVD drives

    Mounting:
          Mounting points: /mount and /media

    Checking errors:
          fsck: Unmount the device before running this file checks.   
          fsck -p /dev/sdb1      will check and automatically repair any problems with the device
```


## Logging
```bash


```



### Privacy
```bash



```
