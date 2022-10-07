#!/bin/bash

kubectl create ns icgroup --dry-run -o yaml > 01-create-namespace.yml

tee 02-create-pvc-pgsql.yml <<EOF
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
	name: data-postgres-claim
	namespace: icgroup
	spec:
		accessModes:
			- ReadWriteOnce
		storageClassName: "longhorn"
		resources:
			requests:
				storage: 2Gi
EOF

kubectl create deploy
