# Personal Knowledge Base

## Container Registry
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
