# devenv
Scripts for setting up development environment

1. Run multipass launch command (replace ```<name>``` with name of instance):
``` 
multipass launch -n <name> --cloud-init config_private.yaml
```

2. Get IP address of instance, and password for code-server:
```
multipass info <name>
multipass exec <name> -- cat ./.config/code-server/config.yaml 
```

3. Modify /etc/hosts file with IP address.  Add the following line:
```
<ipaddr> www.sodc.local
``` 

4. Pull source repositories via Code Server:
  
  a. Browse to https://www.sodc.local:8443, accept self-signed certificate and log in.

  b. Under 'Source Control' click on 'Clone Repository'

  c. Click 'Clone from Github' and follow authentication process.

  d. Select repositories to clone and specify path as '/var/www/'

  e. Open folder: /var/www/

5. Extract private_config.zip to ./local/private

6. Modify ./local/.env.  NB, your email needs to be the one registered with GitHub.  If you have email privacy on, use the one displayed in account settings.

7. Mount ./local to /local on development environment
```
multipass mount ./local <name>:/local
```

7. Run Start Up Script.  This will copy the config files into the dev environment, configure the git user values, start docker and install the website. 
```
multipass exec test2 -- cp -r /private/ /var/www/ 
```


---

Need to config JWT:
```
sudo docker-compose exec php php bin/console lexik:jwt:generate-keypair
```

Also need to run message consume:
```
sudo docker-compose exec php php bin/console messenger:consume -vv
```

Configure user.email and user.name
```
git config --global user.name <name>
git config --global user.email <email>
```
