#!/bin/bash
sudo useradd -p "$6$cnJkE.7z$.TaPEk2z1JLeS6qNh/dGO5/wD5tNLSw2XklozQrv4xfbBccwqC4vBU.un.HCcTXo500X0.Kffw9oTJ2knVNS2/" devdb2
sudo -u postgres createuser devdb
sudo -u postgres createdb devdb  
#sudo -u postgres psql -c "alter user devuser with encrypted password 'password'; grant all privileges on database devdb to devuser;" 
