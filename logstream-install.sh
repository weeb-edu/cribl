#!/bin/bash -xe
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

echo "Installing Git + System Updates"
  
apt-get update
apt-get install git jq netcat

echo "Creating cribl user"
adduser cribl -d /home/cribl -c "Cribl LogStream User" -m
usermod -aG sudo cribl

echo "Setup SSH access"
mkdir /home/cribl/.ssh
chmod 700 /home/cribl/.ssh
chown -R cribl.cribl /home/cribl/.ssh

echo "Setup MOTD"
echo -e "\n" >> /etc/motd
echo "██╗      ██████╗  ██████╗ ███████╗████████╗██████╗ ███████╗ █████╗ ███╗   ███╗" >> /etc/motd
echo "██║     ██╔═══██╗██╔════╝ ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔══██╗████╗ ████║" >> /etc/motd
echo "██║     ██║   ██║██║  ███╗███████╗   ██║   ██████╔╝█████╗  ███████║██╔████╔██║" >> /etc/motd
echo "██║     ██║   ██║██║   ██║╚════██║   ██║   ██╔══██╗██╔══╝  ██╔══██║██║╚██╔╝██║" >> /etc/motd
echo "███████╗╚██████╔╝╚██████╔╝███████║   ██║   ██║  ██║███████╗██║  ██║██║ ╚═╝ ██║" >> /etc/motd
echo "╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝" >> /etc/motd
echo -e "\n" >> /etc/motd

echo "Install LogStream"
mkdir -p /opt/cribl
VER_STRING=$(curl -s https://cdn.cribl.io/versions.json | jq -r .version)
curl -Lso - $(curl -s https://cdn.cribl.io/dl/latest) | tar zxvf - -C /opt
chown -R cribl.cribl /opt/cribl

echo "Password reset placeholder"
mkdir -p /opt/cribl/local/cribl/auth
touch /opt/cribl/local/cribl/auth/users.json
chown -R cribl.cribl /opt/cribl
echo '{ "username": "admin", "first": "admin", "last": "admin", "email": "admin", "passwd": "", "password": "admin123" }' > /opt/cribl/local/cribl/auth/users.json

echo "Setting cribl user environment variables"
sed -i '/# User specific environment and startup programs/a export CRIBL_HOME=/opt/cribl' /home/cribl/.bash_profile

echo "CRIBL-2508 workaround"
mkdir -p /opt/cribl/log
touch /opt/cribl/log/cribl.log
chown -R cribl.cribl /opt/cribl/log

# when you're ready- recommend a health check (check licenses) before setting
#echo "Set and enable autostart"
#/opt/cribl/bin/cribl boot-start enable -m systemd -u cribl 
#systemctl enable cribl
#systemctl daemon-reload
#systemctl start cribl" 

echo "Cribl LogStream $VER_STRING install completed."
