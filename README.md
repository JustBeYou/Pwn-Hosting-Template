Pwn hosting template
===
Customize the following locations.
```
./config:# CUSTOMIZE: name and version
./Dockerfile:# CUSTOMIZE: dependinces
./Dockerfile.build:# CUSTOMIZE: dependinces for building the challenge
./Makefile:# CUSTOMIZE: compiler and flags
./src/chall_init.c:// CUSTOMIZE: choose your allowed syscalls
./src/chall.c:// CUSTOMIZE: challenge code here
./README.md:Customize the following locations.
./flag.txt:CUSTOMIZE: flag{}
./conf/chall.xinetd:    # CUSTOMIZE: resource limits
```
There are two dockerfiles in this repository:
* Dockerfile.build - image used only for building the challenge
* Dockerfile - image used for hosting the challenge (smaller, with less deps)

There are two important scripts here:
* build.sh - creates the image used for compilation, compiles the challenge and copies the challenge and the libc to `dist/`
* build_deploy.sh - creates the images used for hosting, the challenge binaries should be already built
