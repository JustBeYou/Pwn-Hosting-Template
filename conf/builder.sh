#!/bin/sh

make
cp /lib/x86_64-linux-gnu/libc.so.6 /app/dist/
chown -R 1000:1000 /app/dist/
