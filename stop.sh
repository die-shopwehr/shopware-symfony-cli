#!/usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
cd ${SCRIPT_PATH}

docker compose down

cd ..
symfony server:stop
