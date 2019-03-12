## cloudron-vscode

----------

Built from https://github.com/codercom/code-server. I will do my best to keep this updated.

## Special Information

- Due to either my limited knowledge of Cloudron, or a limitation of Cloudron itself, I had to generate a password for the app on first app installation.
  This means the `--password` flag is set in CLI. It is plaintext, but better than the random password that is generated on each boot.
  That said, you can change this first time generated password in `/app/data/temp` and then clicking "Configure" in the apps configuration screen

- **I am not able to test the security of this app, however, given a strong enough password, things should be fine. In either case, I would NOT INSTALL ON PRODUCTION SYSTEMS**

- I did not make VSCode or code-server. I just built this *very* *alpha* build of cloudron-vscode. Please, use at your own risk.

## Installing on Cloudron

- Make sure you have [Cloudron CLI installed](https://cloudron.io/developer/cli/) on a Linux computer that is NOT your cloudron server. (See docs for details)
- Then do the follow:
```
cloudron login
cloudron install --image mitchellurgero/org.urgero.codeserver:0.0.2
```

## Special Ports

 - TCP port 3333 is used internally to forward traffic from apps you develop inside VSCode to the outside. However the outside port is configurable via the Cloudron UI.
