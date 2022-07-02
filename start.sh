#!/usr/bin/env bash

while getopts p:u: flag
do
    case "${flag}" in
        p) PHP_VERSION=${OPTARG};;
        u) URL=${OPTARG};;
    esac
done

SCRIPT_PATH=$(dirname "$0")
cd ${SCRIPT_PATH}

symfony local:php:list

docker-compose up -d

cd ..

if [ -n "${PHP_VERSION+1}" ];
then
    echo $PHP_VERSION > .php-version
else
    rm .php-version > /dev/null 2>&1
fi

symfony server:start -d
symfony server:ca:install

if [ -n "${URL+1}" ];
then
    symfony proxy:start
    symfony proxy:domain:attach $URL
fi
