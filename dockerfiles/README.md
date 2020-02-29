Once enough images:
Create function in bashrc
```bash
rdocker() {
    if [[ "$1" == "rpython" ]]; then
        docker run -it --rm --name rpython-container registry.gitlab.com/r.stegeman/rdockerstore/rpython
    elif [[ "$1" == "" ]]; then
        docker run
    ...etc
    else
        echo "Could not be found"
}
```