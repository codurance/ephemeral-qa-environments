#!/bin/bash

docker run -d -u root -p 9090:8080 --name jenkins $(docker build -q jenkins)
