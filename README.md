# nginx-unit-docker-example
Sample showcase of Nginx-unit with Docker

## Introduction
This repo is a demonstration of configuration that can be done with nginx-unit and docker. WIP.

## Steps
Build the docker image:

`docker build . -t unit:0.1`

Run it:

`docker run -d --name unit -p 8000:8300 -v $(pwd):/www unit:0.1`

Put the config:

`docker exec -ti unit curl -X PUT -d @/www/start.json --unix-socket /var/run/control.unit.sock http://localhost/`

The response should be:
```json
{
	"success": "Reconfiguration done."
}
```

You can test with 
`docker exec -ti unit curl http://localhost:8300` or from the host at 8000 port `curl http://localhost:8000`
