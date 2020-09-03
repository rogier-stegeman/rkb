List files:
`ls`
Flags:
```
    -l list vertically
    -t sort by time
    -a show hidden files
    -s show file size
    -R recursive search
```

Get file sizes:
```bash
du -sh *
du -sh [file]
du -sh * | sort -rh
```

Re-run last command with sudo:
`sudo !!`

Remove the need to use sudo for a certain program:
```bash
sudo groupadd [program eg docker]
sudo gpasswd -a $USER [group eg docker]
```

Create symbolic link (shortcut to program):
`ln -s [absolute full path to file] /usr/bin/[name command]`
e.g.
```bash
sudo ln -s /home/vg-ws03/Downloads/apache-jmeter-5.1.1/bin/jmeter.sh /usr/local/bin/jmeter
jmeter
```