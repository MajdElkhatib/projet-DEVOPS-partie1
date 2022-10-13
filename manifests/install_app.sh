#!/bin/bash

KUBECTL_PATH=$(which kubectl)

if [ "${KUBECTL_PATH}" != "" ] ; then
	if [ "$1" == "-q" ]; then
		if [ $# -eq 3 ]; then
			PGSQL_PASS=$2
			PGADMIN_PASS=$3
		else
			echo "$0 -q PGSQL_PASSWORD PGADMIN_PASSWORD"
			exit 1
		fi
	else
		echo "Enter the postgres password"
		read PGSQL_PASS
		echo "Enter the pgadmin password"
		read PGADMIN_PASS
	fi
	echo "Wait for the availability of all pods longhorn"
	kubectl wait --for=condition=ready pods --all -n longhorn-system	
	echo "Generate secrets strings"
	kubectl create secret generic  odoo-pgsql-password --from-literal=odoo="${PGSQL_PASS}" -n icgroup --dry-run=client -o yaml >03-secret_odoo-pgsql.yaml
	kubectl create secret generic  pgadmin --from-literal=pgadmin-password="${PGADMIN_PASS}" -n icgroup --dry-run=client -o yaml >10-secret_pgadmin.yaml
	kubectl apply -f .
	echo "Wait for the availability of all pods with the label env=prod"
	kubectl wait --for=condition=ready pod -l env=prod -n icgroup --timeout=120s
	rm -f 03-secret_odoo-pgsql.yaml 10-secret_pgadmin.yaml

	echo "You can access http://$(ip -f inet addr show enp0s8 | sed -En -e 's/.*inet ([0-9.]+).*/\1/p'):31500 to use the ic-webapp"
else 
	echo "kubectl is not installed"
fi
