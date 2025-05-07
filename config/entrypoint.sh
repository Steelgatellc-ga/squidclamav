#!/bin/bash

freshclam

clamd&
c-icap -d 2&
squid&



while true
do
    sleep 60
done