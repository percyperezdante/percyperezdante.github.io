---
title: "Pop_os"
date: 2024-02-17T22:26:44Z
---

## My config

The following steps are notes I executed after installing Pop OS in my dell XPS 13

1. Wifi adapter
```bash
sudo apt update
sudo apt upgrade
sudo apt install bcmwl-kernel-source
```
Then my drivers appear and I was able to connect to my wifi router

2. In my settings:
  - Disable bluetooth
  - Privacy --> Connectivity Checking --> disabled
  - File history & waste bin --> disabled

3. Additional packages
  
```bash
sudo apt install mpv vim openssh-server  
```


4. Nice tools

- Command line 
  - Vim
  - git
  - teminator
     https://gnome-terminator.org
  - tmux 
  
- GUI
  - brave
  - duckduckgo

- Music
  - mpv
  - youtube-dl
