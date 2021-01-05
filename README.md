# Personal Knowledge Base
## Setup
No need to clone if you just want to use the information. To use the config files, follow the steps below.
#### Link files and create local config
Substitute `zsh` with `bash` if not using zsh.
```bash
cd [path-to-rkb]/configs
touch .zshrc.local
cd ~ 
ln -s [path-to-rkb]/configs/.zshrc ~
ln -s [path-to-rkb]/configs/.zshrc.local ~
ln -s [path-to-rkb]/configs/.tmux.conf ~
```
These will give an error if such a file already exists. You can decide seperately for each file wether to use your own. For files with .local extention support you can place the (relevant) contents of your own file in the .local version after creating it with the `ln` command above, then removing the original and running the `ln` command again. 
<details>
    <summary>Troubleshooting example</summary>
```bash
>>>touch ~/dev/rkb/configs/.bashrc.local
>>>ln -s ~/dev/rkb/configs/.bashrc.local ~
>>>ln -s ~/dev/rkb/configs/.bashrc ~
ln: failed to create symbolic link '/home/username/.bashrc.local': File exists
>>>cat ~/.bashrc >> ~/.bashrc.local
>>>mv ~/.bashrc ~/.bashrc.backup
>>>ln -s ~/dev/rkb/configs/.bashrc ~
```
</details>

## Content
### configs
Contains config files to make working on different machines bearable.

### dockerfiles
Contains dockerfiles which can be used as is, but their main purpose is to build containers for the container registry (see later section).


### knowledge
Contains the knowledge I've gathered over the years. Often contains snippets.

### notes
Notes related to this knowledge base in general.

### scripts
Contains (generalised) scripts (and other files) which I use often.

### shortcuts
Files with shortcuts because I can't remember them all.

## Container Registry
**!!! Outdated, moved to Github, will be updated in the future !!!**
This Gitlab Project also acts as Docker Container Registry.
Dockerfiles are stored in `dockerfiles` and images are stored in Gitlab's Container Registry linked to this project.
General workflow looks like this:
```bash
# Update changed dockerfile
docker build -f [NAME].Dockerfile -t registry.gitlab.com/r.stegeman/rkb/[NAME] .
# Push changes to Gitlab
docker push registry.gitlab.com/r.stegeman/rkb/[NAME]
# Pull image and run container from anywhere.
docker run -it --rm --name [NAME]-container registry.gitlab.com/r.stegeman/rkb/[NAME]
```
To update and push all dockerfiles in `/dockerfiles/` simply run `/dockerfiles/update.py`.

