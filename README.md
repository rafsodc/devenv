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

3. Accept self-signed certificate and log in.

4. Under 'Source Control' click on 'Clone Repository'

5. Click 'Clone from Github' and follow authentication process.

6. Select repositories to clone and specify path as '/var/www/'
