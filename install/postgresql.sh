#!/bin/bash
sudo -u postgres createuser devuser
sudo -u postgres createdb devdb  
#sudo useradd -p "$6$cnJkE.7z$.TaPEk2z1JLeS6qNh/dGO5/wD5tNLSw2XklozQrv4xfbBccwqC4vBU.un.HCcTXo500X0.Kffw9oTJ2knVNS2/" devdb
sudo echo "listen_addresses = '*'" >> /etc/postgresql/13/main/postgresql.conf  
sudo echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/13/main/pg_hba.conf  
sudo echo "host all all ::/0 md5" >> /etc/postgresql/13/main/pg_hba.conf  
sudo -u postgres psql -c "alter user devuser with encrypted password 'password'; grant all privileges on database devdb to devuser;" 
