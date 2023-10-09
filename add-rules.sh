#!/bin/bash

sudo ufw allow from 172.168.0.100 port 3000 to 172.168.0.100 port 3306
sudo ufw allow from 192.168.32.55 to 172.168.0.100 port 3005
sudo ufw reject 3005
ufw allow in on $(ip -o -4 route show to default | awk '{print $5}') to any port 8099
ufw limit from any to any port 6050:6055 proto tcp

ufw status verbose > $1
