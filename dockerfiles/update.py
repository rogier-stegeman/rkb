import os
import subprocess

files = [f.name for f in os.scandir() if f.is_file()]
for file in files:
    print(file)
    if file.endswith(".Dockerfile"):
        name = file.split(".Dockerfile")[0]
        subprocess.run(f"docker build -f {file} -t docker.pkg.github.com/rogier-stegeman/rkb/{name} .", shell=True)
        # subprocess.run(f"docker tag docker.pkg.github.com/rogier-stegeman/rkb/{name}", shell=True)
        subprocess.run(f"docker push docker.pkg.github.com/rogier-stegeman/rkb/{name}", shell=True)
        # subprocess.run(f"docker push registry.gitlab.com/r.stegeman/rkb/{name}", shell=True)
