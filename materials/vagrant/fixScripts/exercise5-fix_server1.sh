#!/bin/bash
sudo -u vagrant -i <<'EOF'

ssh-keygen -t rsa -f /vagrant/id_rsa -q -N ''

cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa
chmod 0600 /home/vagrant/.ssh/id_rsa

cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

EOF

cat > /home/vagrant/.ssh/config <<EOF
Host server*
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
EOF

cp /vagrant/id_rsa /root/.ssh/id_rsa
chmod 0600 /root/.ssh/id_rsa

cat /vagrant/id_rsa.pub >> /root/.ssh/authorized_keys
chmod 0600 /root/.ssh/authorized_keys

cat > /root/.ssh/config <<EOF
Host server*
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
EOF