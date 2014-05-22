mkdir /home/dooferlad/.ssh
chmod 700 /home/dooferlad/.ssh
chown dooferlad.dooferlad /home/dooferlad/.ssh
mv /home/dooferlad/authorized_keys /home/dooferlad/.ssh/authorized_keys
chmod 644 /home/dooferlad/.ssh/authorized_keys
chown dooferlad.dooferlad /home/dooferlad/.ssh/authorized_keys
sleep 1
