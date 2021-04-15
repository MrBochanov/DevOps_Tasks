#!/bin/bash
# Time zone
echo "Europe/Moscow" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata
#Locale
sudo update-locale LANG=en_US.UTF-8
#Run SSHD at port 2498 instead of 22
sudo sed -i "s|^#Port 22|Port 2498|g" /etc/ssh/sshd_config
service sshd restart
#Deny remote login as root user
sudo sed -i "s|^#PermitRootLogin prohibit-password|PermitRootLogin no|g" /etc/ssh/sshd_config
service sshd restart
#Add serviceuser account to the system
sudo adduser --disabled-password --gecos "" serviceuser
#Grant sudo rights to the user serviceuser
sudo usermod -aG sudo serviceuser
#Limit sudo permissions of the user serviceuser to start|stop|restart services
echo "serviceuser ALL=(ALL) !ALL" >> /etc/sudoers
echo "serviceuser ALL=NOPASSWD: /usr/bin/systemctl start"  >> /etc/sudoers
echo "serviceuser ALL=NOPASSWD: /usr/bin/systemctl stop"  >> /etc/sudoers
echo "serviceuser ALL=NOPASSWD: /usr/bin/systemctl restart"  >> /etc/sudoers
#Install Nginx server and make it autostart after booting
sudo apt update -qq && sudo apt --no-install-recommends -y install nginx && systemctl enable nginx
#Install Monit server and make it autostart after booting
sudo apt update -qq && sudo apt --no-install-recommends -y install monit && systemctl enable monit
#Configure Nginx to proxy requests to Monit server with the basic auth using credentials "devops/test"
#monit
echo "set httpd port 2812" >> /etc/monit/monitrc
echo "allow devops:test" >> /etc/monit/monitrc
#nginx
sudo sed -i "s|root /var/www/html;|#root /var/www/html|g" /etc/nginx/sites-available/default
sudo sed -i '/^\tlocation \/ {/!b;n;c\\tproxy_pass http://localhost:2812;' /etc/nginx/sites-available/default
systemctl restart monit
sudo nginx -s reload
#Configure UFW
sudo ufw allow 80/tcp
sudo ufw allow 2498/tcp
echo "y" | sudo ufw enable
