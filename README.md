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

3. Extract private_config.zip to ./private

4. Mount ./private to /private on development environment
```
multipass mount ./private <name>:/private
```

5. Accept self-signed certificate and log in.

6. Under 'Source Control' click on 'Clone Repository'

7. Click 'Clone from Github' and follow authentication process.

8. Select repositories to clone and specify path as '/var/www/'

9. Copy private files to necessary location on development environment
```
cp -r /private/* /var/www/
```
