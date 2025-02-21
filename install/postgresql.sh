#!/bin/bash
sudo -u postgres createuser devuser
sudo -u postgres createdb devdb  
sudo echo "listen_addresses = '*'" >> /etc/postgresql/13/main/postgresql.conf  
sudo echo "host all all 0.0.0.0/0 scram-sha-256" >> /etc/postgresql/13/main/pg_hba.conf  
sudo echo "host all all ::/0 scram-sha-256" >> /etc/postgresql/13/main/pg_hba.conf  
sudo -u postgres psql -c "alter user devuser with encrypted password 'password'; grant all privileges on database devdb to devuser;" 
sudo systemctl restart postgresql
