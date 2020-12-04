#!/usr/bin/env bash

# runs mailq command inside postfix mailcow docker container.

DOCKER_IMAGE=postfix-mailcow

docker exec -t $(docker ps -qf name=${DOCKER_IMAGE}) mailq
