## cloudron-vscode

----------

Built from https://github.com/codercom/code-server. I will do my best to keep this updated.

## Special Information

- Due to either my limited knowledge of Cloudron, or a limitation of Cloudron itself, I had to generate a password for the app on first app installation.
  This means the `--password` flag is set in CLI. It is plaintext, but better than the random password that is generated on each boot.
  That said, you can change this first time generated password in `/app/data/temp` and then clicking "Configure" in the apps configuration screen

- **I am not able to test the security of this app, however, given a strong enough password, things should be fine. In either case, I would NOT INSTALL ON PRODUCTION SYSTEMS**

- I did not make VSCode or code-server. I just built this *very* *alpha* build of cloudron-vscode. Please, use at your own risk.

## Currently Installed Packages / Supported Languages

- Follows Cloudron:base:1.0.0 (See: [Cloudron Baseimage Packages](https://cloudron.io/developer/baseimage/#packages)

**On top of the above, I have also included the following packages (since this is Visual Studio Code after all)**

- Powershell, installed from Microsofts pre-built binaries for Ubuntu 18.04 64 bit (If you need a different CPU arch, you will need to download this repo, and cloudron build to get an image that works for non-64 bit CPUs)
- Mono-complete for C# / Visual Basic development, only CLI applications are supported at this time however.

**Supported Langauges**

(If I missed one, let me know by opening an issue or Pull Request.)

- JavaScript
- PHP5/7 (PHP 7.0.3 installed, which is backwards compatible with most PHP5 functions and scripts)
- Go
- NodeJS
- Visual Basic
- C#
- PowerShell
- Java
- Perl
- Python
- Ruby

## Installing on Cloudron

- Make sure you have [Cloudron CLI installed](https://cloudron.io/developer/cli/) on a Linux computer that is NOT your cloudron server. (See docs for details)
- Then do the following:

```
cloudron login
cloudron install --image mitchellurgero/org.urgero.codeserver:0.0.3 # Might need to change to whatever the latest build is.
```

## Special Ports

 - TCP port 3333 is used internally to forward traffic from apps you develop inside VSCode to the outside. However the outside port is configurable via the Cloudron UI.
