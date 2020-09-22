# Shortcuts
Keyboard shortcuts
## Misc
Lorem Ipsum<br>
`sh -c 'sleep 0.15; xdotool keyup Control type "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."'`
20 enters<br>
`sh -c 'sleep 0.15; xdotool keyup Control; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return; xdotool key Return'`
lolcat<br>
`sh -c 'sleep 0.15; xdotool type " | lolcat"; xdotool key Return'`
flameshot<br>
`flameshot gui`
paste email<br>
`sh -c 'sleep 0.15; xdotool type "rogier.stegeman@vartion.com"'`
email to clipboard<br>
`sh -c 'echo "rogier.stegeman@vartion.com" | xclip -sel clip && xclip -out -sel clip'`
center mouse (4 monitors)<br>
`bash -c 'xdotool mousemove 2880 910'`

## Docker
docker exec -it<br>
`sh -c 'sleep 0.15; xdotool keyup Control type "docker exec -it "'`

docker-compose down<br>
`sh -c 'sleep 0.15; xdotool keyup Control type "docker-compose down"; xdotool key Return'`
docker-compose up<br>
`sh -c 'sleep 0.15; xdotool keyup Control type "docker-compose up"; xdotool key Return'`
docker-compose up --build<br>
`sh -c 'sleep 0.15; xdotool keyup Control type "docker-compose up --build"; xdotool key Return'`

docker container prune<br>
`sh -c 'sleep 0.20; xdotool keyup Control type "docker container prune"; xdotool key Return'`
docker image prune all<br>
`sh -c 'sleep 0.15; xdotool keyup Control type "docker image prune -a"; xdotool key Return'`
docker system prune all<br>
`sh -c 'sleep 0.15; xdotool keyup Control type "docker system prune -a"; xdotool key Return'`
