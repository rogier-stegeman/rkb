# Ultimate windows install guide
No-fuss configuring Windows.

## Sources
https://yduman.github.io/blog/wsl2-setup/
https://docs.microsoft.com/en-us/windows/wsl/install-win10

## Workflow
### Install WSL
1. Run in powershell:
`dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
`dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
2. Install https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
3. Go to Microsoft Store and download Ubuntu 20.04 LTS
4. Run `wsl --set-version Ubuntu_20.04 2`
5. Run `wsl --set-default-version 2`
6. Verify that you have version 2 with `wsl --list --verbose`
7. Download these fonts https://github.com/romkatv/powerlevel10k#manual-font-installation
8. Open Windows Terminal
9. Open settings (press control + comma ) and set the default profile to the ID listed for Ubuntu in the list somewhere later in the file.
10. Set the json for Ubuntu as follows:
```
{
    "guid": "{<LONG ID>}",
    "hidden": false,
    "name": "Ubuntu-20.04",
    "source": "Windows.Terminal.Wsl",
    "colorScheme": "One Half Dark",
    "fontFace": "MesloLGS NF",
    "commandline": "wsl.exe /mnt/c/Users/<USERNAME> "
},
```
11. Open windows terminal and install zsh:
```
apt-get update
apt-get upgrade
apt-get dist-update
apt-get autoremove
sudo apt install zsh
$ sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
zsh
```
Enable plugins by setting the plugin line in `nano ~/.zshrc` to `plugins=(docker git fd z zsh-autosuggestions zsh-syntax-highlighting)`
Set the theme in the same file close to the top: `ZSH_THEME="powerlevel10k/powerlevel10k"`

12. Set docker to use WSL 2 in Docker Desktop settings (2 settings).
