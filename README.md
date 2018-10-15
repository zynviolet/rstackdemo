## Demo: Docker Services for R 

This is a companion for Docker tutorial **[deploy a stack to a swarm](https://docs.docker.com/engine/swarm/stack-deploy/)**. Instead of deploying `python` application, we deploy `R` application here.

For local testing purposes, basic operation is as follows,

```bash
## Initiate swarm mode
docker swarm init 

## A swarm consists of multiple Docker engine
## a registry is required to distribute images to all of them
docker service create --name registry --publish published=5000,target=5000 registry:latest

## Build application images
docker-compose build 

## Push generated images to the registry
docker-compose push 

## Deploy the stack to the swarm
docker stack deploy --compose-file docker-compose.yml rstackdemo

## Now it is ready
docker stack services rstackdemo

##--- Testing if it works ---##
curl localhost:8899/hello

## Bring the stack down
docker stack rm rstackdemo

## Remove the registry
docker service rm 

## Leave swarm mode
docker swarm leave --force
```
