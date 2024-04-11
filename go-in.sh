#!/bin/bash 

set -ex

# Build docker containers
docker compose build --pull --build-arg FIX_UID="$(id -u)" --build-arg FIX_GID="$(id -g)"

# Start docker environment
docker compose up -d

# Login to docker container
docker compose exec app bash
