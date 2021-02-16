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

### Colours
```bash
#/bin/bash
#colours.sh
echo normal
echo Black: 	\[30m Black	\[0m
echo Red: 		\[31m Red		\[0m
echo Green: 	\[32m Green	\[0m
echo Yellow: 	\[33m Yellow	\[0m
echo Blue: 		\[34m Blue		\[0m
echo Magenta: 	\[35m Magnenta	\[0m
echo Cyan: 		\[36m Cyan		\[0m
echo White: 	\[37m	White	\[0m
```
`bash colours.sh`
