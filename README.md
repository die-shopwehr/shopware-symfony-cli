# Shopware-Symfony-Cli (MacOs)

## Requirements
- Docker Desktop on Mac
- Symfony CLI
- Php
- Composer
- node

### Install Symfony CLI
``
brew install symfony-cli/tap/symfony-cli
``

### Install Php
``
brew install php
``

### Install Composer
See: https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos

### Install node
``
brew install node
``

### Setup Symfony proxy if you want to use local domains
See: https://symfony.com/doc/current/setup/symfony_server.html#setting-up-the-local-proxy

## Setup
```
git clone https://github.com/shopware/platform.git
cd platform
git clone https://github.com/die-shopwehr/shopware-symfony-cli.git
chmod +x shopware-symfony-cli/start.sh
chmod +x shopware-symfony-cli/stop.sh

# start server with prefered options (see below)
shopware-symfony-cli/start.sh

symfony composer install

symfony php bin/console system:setup
#db host: 127.0.0.1 
#db user: root
#db password: root
#db port: 13307

symfony composer run setup
```

### Multiple instances
If you would like to run multiple instances of Shopware you will have to configure different ports in the `shopware-symfony-cli/.env` file

### Start the server
```
shopware-symfony-cli/start.sh [options]
-p      Php version      Optional [default: System default]
-u      Url              Optional [default: none]

Examples:
shopware-symfony-cli/start.sh
shopware-symfony-cli/start.sh -u sw6-4-12-0 -p 8.0
shopware-symfony-cli/start.sh -p 8.0
shopware-symfony-cli/start.sh -u sw6-4-12-0
```

### Stop the server
```
shopware-symfony-cli/start.sh [options]

Examples:
shopware-symfony-cli/stop.sh
```

## Howto...
### Install custom plugins
Create the `custom/plugins` folder (in platform) if not already existent

### Build Storefront
```
symfony composer build:js:storefront
symfony php bin/console theme:compile
```

### Build Administration
```
symfony composer build:js:admin
```

### Run Cypress tests
Not implemented yet

### Install different PHP Versions
Run `symfony local:php:list` to see already installed php versions. Install specific version by executing `brew install php@7.4`. You may will have run `local:php:refresh`afterwards.

If you want to switch the system's default, simply run:
```
brew unlink php 
#if specific version is already linked: brew unlink php@8.0 
brew link php@7.4
```

You will not have to link a specific Php version when using the start command's option `-p`. In that case a `.php-version` file is going to be created and when prefixing commands with `symfony` the Symfony CLI will always refer the configured version of Php.

### Install Php extensions
```
symfony pecl install {extension}
```

