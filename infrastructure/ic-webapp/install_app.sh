#!/bin/bash

yum -y install git

su vagrant -c "git clone https://github.com/Romain-Revel/ajc-projet-final.git /home/vagrant/ajc-projet-final"
su vagrant -c "cd /home/vagrant/ajc-projet-final && git checkout dev && cd manifests && sh install_app.sh -q odoo pgadmin"

