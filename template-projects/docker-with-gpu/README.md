These files allow you to quickly run a gpu-dependent project using Docker.

### Setup
1. Add packages to `requirements.txt`
2. replace as needed:
    - Dockerfile CMD
    - in sh script:
      - docker run flags: -it -d
      - projectname
      - ports

### Usage
Call the script, add `build` to rebuild the image
`sh run-docker-with-gpu.sh [build]`
