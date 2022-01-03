sudo -u vagrant -i <<'EOF'

yes | ssh-keygen -t rsa -f /vagrant/id_rsa -q -N ''

cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa
chmod 0600 /home/vagrant/.ssh/id_rsa

cat /home/vagrant/.ssh/id_rsa

cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys
chmod 0600 ~/.ssh/authorized_keys

touch ~/.ssh/config
echo 'Host server*' > ~/.ssh/config
echo '  StrictHostKeyChecking no' >> ~/.ssh/config
echo '  UserKnownHostsFile=/dev/null' >> ~/.ssh/config

EOF
