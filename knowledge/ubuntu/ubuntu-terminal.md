### Links
Create shortcut to program:
```bash
ln -s [absolute full path to file] /usr/bin/[name command]
# e.g.
sudo ln -s [path-to-jmeter]/jmeter.sh /usr/local/bin/jmeter
```
Now simply typing `jmeter` will start the program.

Sync files:
```bash
ln [file] [new link location]
```

### SSH
Create SSH shortcuts:
`nano ~/.ssh/config`:
```
Host [servername]
	Hostname [ip]
	Port [port]
	User [user]

[etc]
```
Now `ssh [servername]` will do `ssh [username]@[ip]:[port]`


### Sudo
Remove the need to use sudo for a program/command:
```bash
sudo groupadd [program eg docker]
sudo gpasswd -a $USER [group eg docker]
```

### Finding stuff
Search whole system:
```bash
sudo find / -name "search-query"
```

### Assorted terminal stuff
Run command after x time:
```bash
# '&&' rather than '&' allows for cancellation with ^C.
sleep 10s && python app.py
sleep 4d 12h 30m 10s && python app.py
```
