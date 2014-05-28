#!/bin/bash
set -ex

# Set up user and SSH keys
#mkdir /home/dooferlad/.ssh
#chmod 700 /home/dooferlad/.ssh
#chown dooferlad.dooferlad /home/dooferlad/.ssh
#mv /home/dooferlad/authorized_keys /home/dooferlad/.ssh/authorized_keys
#chmod 644 /home/dooferlad/.ssh/authorized_keys
#chown dooferlad.dooferlad /home/dooferlad/.ssh/authorized_keys

mkdir /root/.ssh
chmod 700 /root/.ssh
mv /root/authorized_keys /root/.ssh/authorized_keys
chmod 644 /root/.ssh/authorized_keys

# Import data into MongoDB
cd /srv/roadmap
/usr/bin/python status_hacking.py

# Set up database
./manage.py syncdb --noinput
