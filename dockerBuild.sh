#!/bin/bash

# build docker image

docker build -t jlucero805/entropy:temporal-worker-hy --platform=linux/amd64 .