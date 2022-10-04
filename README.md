# devenv
Scripts for setting up development environment

1. Run multipass launch command (replace ```<name>``` with name of instance):
``` 
multipass launch -n <name> --cloud-init config.yaml --timeout 600 --mem 4G --cpus 4 --disk 10G -vvv focal
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

6. Copy ./local/.env to ./local/.env.local and modify with your details.  NB, your email needs to be the one registered with GitHub.  If you have email privacy on, use the one displayed in account settings.

7. Mount ./local to /local on development environment
```
multipass mount ./local <name>:/local
```

8. Run Setup Script.  This will copy the config files into the dev environment, configure the git user values, start docker and install the website. Enter email address for admin account here.
```
multipass exec sodc --working-directory /var/www/sodc-api/ -- /local/setup.sh 
```

9.  Run Start Script.
```
multipass exec sodc --working-directory /var/www/sodc-api/ -- /local/start.sh 
```
