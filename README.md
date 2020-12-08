Pwn hosting template
===
Customize the following locations.
```
./config:# CUSTOMIZE: name and version
./Dockerfile:# CUSTOMIZE: dependinces
./Makefile:# CUSTOMIZE: compiler and flags
./src/chall_init.c:// CUSTOMIZE: choose your allowed syscalls
./src/chall.c:// CUSTOMIZE: challenge code here
./README.md:Run `grep -r . -e "CUSTOMIZE"` to list where you have to customize this template for your challenge.
./flag.txt:CUSTOMIZE: flag{}
./conf/chall.xinetd:    # CUSTOMIZE: resource limits
```
Compiled binaries will be outputed to `dist/`
