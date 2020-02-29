import os
import subprocess

files = [f.name for f in os.scandir() if f.is_file()]
for file in files:
    print(file)
    if file.endswith(".Dockerfile"):
        name = file.split(".Dockerfile")[0]
        subprocess.run(f"docker build -f {file} -t registry.gitlab.com/r.stegeman/rdockerstore/{name} .", shell=True)
        subprocess.run(f"docker push registry.gitlab.com/r.stegeman/rdockerstore/{name}", shell=True)
