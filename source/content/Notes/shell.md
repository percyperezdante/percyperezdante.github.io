---
title: "Shell"
date: 2020-05-21T11:52:12+01:00
---


#### 1. Sending message to pts terminal

```bash
# List of opened terminals. 
percy@prec:~$ ls -tlr /dev/pts/
total 0
c--------- 1 root  root   5, 2 May 21 06:18 ptmx
crw--w---- 1 percy tty  136, 2 May 21 11:36 2
crw--w---- 1 percy tty  136, 0 May 21 11:52 0
crw--w---- 1 percy tty  136, 3 May 21 11:53 3
crw--w---- 1 percy tty  136, 4 May 21 11:53 4
crw--w---- 1 percy tty  136, 6 May 21 11:53 6
crw--w---- 1 percy tty  136, 5 May 21 11:53 5


percy@prec:~$ echo "How are you ?" > /dev/pts/6

```

You can use "ps" to identify each pts terminal.

