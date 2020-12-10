## Fix all network issues after docker restart
Kill all pids using a docker-proxy port:
`sudo lsof -i | grep docker-pr | awk '{print $2}' | xargs kill`
Restart all firenze networks:
`sudo docker network ls | grep firenze | awk '{print $2}' | xargs -I {} sh -c "docker network rm {}; docker network create {}"`
