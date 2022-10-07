#!/bin/bash
image="ic-webapp"
name="test-ic-webapp"
port="8080"
docker stop ${name} && docker rm ${name}
docker build -t ${image}:1.0 .
docker run -d -p ${port}:${port} \
  -e ODOO_URL='https://www.odoo.com/' \
  -e PGADMIN_URL='https://www.pgadmin.org/' \
  --name=${name} ${image}:1.0

sleep 3

curl http://localhost:${port}