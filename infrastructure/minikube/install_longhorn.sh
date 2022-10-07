#!/bin/bash

HELM_PATH="$(which helm)"

if [ "${HELM_PATH}" == "" ]; then
        # Get HELM
        curl https://get.helm.sh/helm-v3.10.0-linux-amd64.tar.gz -o helm-v3.10.0-linux-amd64.tar.gz
        tar xfz helm-v3.10.0-linux-amd64.tar.gz
        sudo mv linux-amd64/helm /usr/local/bin && chmod +x /usr/local/bin/helm
        rm -Rf tar xfz helm-v3.10.0-linux-amd64.tar.gz linux-amd64/
        HELM_PATH=/usr/local/bin/helm
fi


# Install longhorn with helm
${HELM_PATH} repo add longhorn https://charts.longhorn.io
if [ $? -ne 0 ]; then
        echo "Impossible d'ajouter le repo à helm"
        exit 1
fi

${HELM_PATH} repo update

${HELM_PATH} install longhorn longhorn/longhorn --namespace longhorn-system --create-namespace
if [ $? -ne 0 ]; then
        echo "Impossible d'installer longhorn"
        exit 1
fi
