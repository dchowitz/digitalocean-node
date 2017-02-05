# digitalocean-node

Demonstrates, how to deploy a Node.js app to [Digital Ocean](https://www.digitalocean.com/).
Followed this [tutorial](https://scotch.io/tutorials/how-to-host-a-node-js-app-on-digital-ocean)...

## One-Time Setup

This spawns a droplet (ubuntu) and creates a docker host on it:
```bash
docker-machine create --driver digitalocean --digitalocean-access-token=<accesstoken> <docker-host-name>
```

Detailed parameters for the digitalocean driver are shown [here](https://docs.docker.com/machine/drivers/digital-ocean/).

How to connect docker-machine to an existing droplet is explained [here](https://www.digitalocean.com/community/questions/how-can-i-attach-docker-machine-to-an-existing-droplet-created-with-another-docker-machine).

## Deploying

```bash
# make docker on digitalocean droplet the active one for this client
eval $(docker-machine env digitalocean-node)

# stop container
docker stop digitalocean-node

# remove container
docker rm digitalocean-node

# remove image (node image is cached though)
docker rmi digitalocean-node:dev

# create image on droplet and run container from it
docker build -t digitalocean-node:dev .
docker run -d -p 80:3000 --name digitalocean-node digitalocean-node:dev

# unset docker host for this client
eval $(docker-machine env -u)
```