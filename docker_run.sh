#!/usr/bin/env bash

docker build -t picamera:latest .
docker run -it --rm --name=picamera-example -p 80:80 -p 9999:9999 picamera

