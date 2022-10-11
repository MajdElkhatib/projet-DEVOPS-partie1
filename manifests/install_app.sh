#!/bin/bash

KUBECTL_PATH=$(which kubectl)

if [ "${KUBECTL_PATH}" != "" ] ; then
	if [ "$1" == "-q" ]; then
		PGSQL_PASS="odoo"
		PGADMIN_PASS="pgadmin"
	else
		if [ $# -eq 2 ]; then
			PGSQL_PASS=$1
			PGADMIN_PASS=$2
		else
			echo "$0 -q | PGSQL_PASSWORD PGADMIN_PASSWORD"
			exit 1
		fi
	fi
	
	kubectl create secret generic  odoo-pgsql-password --from-literal=odoo="${PGSQL_PASS}" -n icgroup --dry-run=client -o yaml >03-secret_odoo-pgsql.yaml
	kubectl create secret generic  pgadmin --from-literal=pgadmin-password="${PGADMIN_PASS}" -n icgroup --dry-run=client -o yaml >10-secret_pgadmin.yaml
	kubectl apply -f .
	sleep 3
	echo "Wait for the availability of all pods with the label env=prod"
	kubectl wait --for=condition=ready pod -l env=prod -n icgroup --timeout=120s

	echo "You can access http://$(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'):31500 to use the ic-webapp"
else 
	echo "kubectl is not installed"
fi
