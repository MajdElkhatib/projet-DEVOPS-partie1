#!/bin/bash
app="ic-webapp"
port="8080"
docker stop ${app} && docker rm ${app}
docker build -t ${app}:1.0 .
docker run -d -p ${port}:${port} --name=${app} ${app}

curl http://localhost:${port}