# devenv
Scripts for setting up development environment

1. Run multipass launch command (replace ```<name>``` with name of instance):
``` 
multipass launch -n <name> --cloud-init config.yaml
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

4. Extract private_config.zip to ./private

5. Mount ./private to /private on development environment
```
multipass mount ./private <name>:/private
```

6. Browse to https://www.sodc.local:8443, accept self-signed certificate and log in.

7. Under 'Source Control' click on 'Clone Repository'

8. Click 'Clone from Github' and follow authentication process.

9. Select repositories to clone and specify path as '/var/www/'

10. Copy private files to necessary location on development environment
```
multipass exec test2 -- cp -r /private/ /var/www/ 
```

11. In Code Server, open the folder /var/www/sodc-api/

12. Open a terminal (Left Menu, Terminal > New Terminal.  Make sure the path is /var/www/sodc-api

13. Run docker-compose:
```
sudo docker-compose --env-file .env.local up -d
```
