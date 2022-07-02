# Shopware-Symfony-Cli (MacOs)

## Requirements
- Docker Desktop on Mac
- Symfony CLI
- Php
- Composer
- node
- mysql-client

### Install Symfony CLI
``
brew install symfony-cli/tap/symfony-cli
``

### Install Php
``
brew install php@8.0
``

### Install Composer
See: https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos

### Install node
``
brew install node
``

### Install mysql-client
``
brew install mysql-client
``

### Setup Symfony proxy if you want to use local domains
See: https://symfony.com/doc/current/setup/symfony_server.html#setting-up-the-local-proxy

## Setup
```
#clone shopware dev template
git clone https://github.com/shopware/development.git
cd development
rm -rf platform
git clone https://github.com/shopware/platform.git

git clone symfony-cli-platform
chmod +x shopware-symfony-cli/start.sh
chmod +x shopware-symfony-cli/stop.sh

# start server with prefered options (see below)
shopware-symfony-cli/start.sh

bin/setup
#db host: 127.0.0.1 
#db user: root
#db password: root
#db port: 13307

cp .env platform/.env
cp config/* platform/config/
```

## Start the server
```
shopware-symfony-cli/start.sh [options]
-p      Php version      Optional [default: System default]
-u      Url              Optional [default: none]

Examples:
shopware-symfony-cli/start.sh
shopware-symfony-cli/start.sh -u sw6.4.12.0 -p 8.0
shopware-symfony-cli/start.sh -p 8.0
shopware-symfony-cli/start.sh -u sw6.4.12.0
```

## Stop the server
```
shopware-symfony-cli/start.sh [options]

Examples:
shopware-symfony-cli/stop.sh
```
