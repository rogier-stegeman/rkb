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

Find files:
```
fdfind [options] [pattern] [location]
    -d [max depth]  Max directory depth to search in.
    -e [ext]    Find files of certain file extention only.
    -H Also search for hidden directories/files.
    -t [types]      Types to search for. (fdlxe)
```
Example:
`fdfind -d 4 -e png -H -t f "month-[0-9]{1,2}-day-[0-9]{1,2}" ~/dev` or 
` fdfind month-05 /`
return:
`/home/[user]/dev/data/month-05-day-03.png`
`/home/[user]/dev/data/month-05-day-24.png`


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

Replace regex matches in file:
```bash
sed -i "s/[PATTERN]/[REPLACEMENT]/[FLAGS]" [FILEPATH]
# e.g. replace all `${myurl}` with a specific link:
sed -i "s/\${myurl}/http:\/\/192.168.1.666:80/g" nginx.conf
# Note that regex characters and the seperator sign are escaped.
# You can also choose a different seperator sign:
sed -i "s|\${myurl}|http://192.168.1.666:80|g" nginx.conf
sed -i "s:\${myurl}:http://192.168.1.666:80:g" nginx.conf
```
