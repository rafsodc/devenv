# devenv
Scripts for setting up development environment

1. Clone git repository
```
git clone git@github.com:rafsodc/devenv.git
```

2. Extract private.zip to devenv/local/private

3. Run multipass launch command (replace ```<name>``` with name of instance):
``` 
multipass launch -n <name> --cloud-init config.yaml --timeout 3600 --memory 4G --cpus 4 --disk 10G -vvv focal
```

4. Get IP address of instance, and password for code-server:
```
multipass info <name>
multipass exec <name> -- cat ./.config/code-server/config.yaml 
```

5. Modify /etc/hosts file with IP address.  Add the following line:
```
<ipaddr> www.sodc.local
``` 

6. Pull source repositories via Code Server:
  
    a. Browse to https://www.sodc.local:8443, accept self-signed certificate and log in.

    b. Under 'Source Control' click on 'Clone Repository'

    c. Click 'Clone from Github' and follow authentication process.

    d. Select the following repositories to clone and specify path as '/var/www/':
    
        * rafsodc/sodc-api
        
        * rafsodc/SODC-React-Members

    e. Open folder: /var/www/

7. Extract private_config.zip to ./local/private

8. Copy ./local/.env to ./local/.env.local and modify with your details.  NB, your email needs to be the one registered with GitHub.  If you have email privacy on, use the one displayed in account settings.

9. Mount ./local to /local on development environment
```
multipass mount ./local <name>:/local
```

10. Run Setup Script.  This will copy the config files into the dev environment, configure the git user values, start docker and install the website. Enter email address for admin account here.
```
multipass exec <name> --working-directory /var/www/sodc-api/ -- /local/setup.sh 
```
Note: Known issue with MacOS.  If this does not generate any output, it's likely that the devenv folder has been sync'ed to iCloud, and files are not downloaded.  Right click on folder and select 'download now'.

11. Run Start Script.
```
multipass exec <name> --working-directory /var/www/sodc-api/ -- /local/start.sh 
```

NB.  The dev environment uses a 'test' API key for the Notify Service to prevent accidental messages.  Email address must be set to one registered as a team address on the Notify Service, otherwise emails won't be received.
