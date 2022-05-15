#!/bin/bash
sudo -u postgres createuser devuser
sudo -u postgres createdb devdb   
sudo -u postgres psql -c "alter user devuser with encrypted password 'password'; grant all privileges on database devdb to devuser;" 
