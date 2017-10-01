# Docker for Magento2 [![Build Status](https://travis-ci.org/EmakinaFR/docker-magento2.svg?branch=master)](https://travis-ci.org/EmakinaFR/docker-magento2)
Build a complete Docker environment that meets [Magento2](http://devdocs.magento.com/guides/v2.2/install-gde/system-requirements-tech.html) requirements.

## Architecture
* `php`: [PHP 7.1 version](https://github.com/ajardin/docker-magento/blob/master/web/Dockerfile) with FPM.
* `nginx`: [nginx:latest](https://hub.docker.com/_/nginx/) image.
* `mysql`: [mariadb:latest](https://hub.docker.com/_/mariadb/) image.
* `elasticsearch`: [elasticsearch:2](https://hub.docker.com/_/elasticsearch/) image.
* `redis`: [redis:latest](https://hub.docker.com/_/redis/) image.
* `blackfire`: [blackfire/blackfire:latest](https://hub.docker.com/r/blackfire/blackfire/) image.
* `maildev`: [djfarrelly/maildev:latest](https://hub.docker.com/r/djfarrelly/maildev/) image.

## Additional Features
Since this environment is designed for a local usage, it comes with features helping the development workflow.

### Nginx/PHP
The `nginx` container has a mount point used to share source files.
By default, the `~/www/` directory is mounted from the host. It's possible to change this path by editing the `docker-compose.yml` file.

It's also possible to add custom servers: all `./nginx/servers/*.conf` files are copied into the Nginx directory.
And the `./php/custom.ini` file is used to customize the PHP configuration. 

## Installation
The following process assumes that [Docker Engine](https://www.docker.com/docker-engine) and [Docker Compose](https://docs.docker.com/compose/) are correctly installed.
Otherwise, you should have a look to the [installation documentation](https://docs.docker.com/engine/installation/) before proceeding further.

### Clone the repository
```bash
$ git clone git@github.com:EmakinaFR/docker-magento2.git magento2
```
It's also possible to download it as a [ZIP archive](https://github.com/EmakinaFR/docker-magento2/archive/master.zip).

### Define the environment variables
```bash
$ cp docker-env.dist docker-env
$ nano docker-env
```

### Build the environment
```bash
$ docker-compose up -d
```

### Check the containers
```bash
$ docker-compose ps
          Name                        Command               State                Ports
----------------------------------------------------------------------------------------------------
magento2_blackfire_1       blackfire-agent                  Up      0.0.0.0:8707->8707/tcp
magento2_elasticsearch_1   /docker-entrypoint.sh elas ...   Up      0.0.0.0:9200->9200/tcp, 9300/tcp
magento2_maildev_1         bin/maildev --web 80 --smtp 25   Up      25/tcp, 0.0.0.0:1080->80/tcp
magento2_mysql_1           docker-entrypoint.sh mysqld      Up      0.0.0.0:3306->3306/tcp
magento2_nginx_1           nginx -g daemon off;             Up      0.0.0.0:80->80/tcp
magento2_php_1             docker-custom-entrypoint         Up      0.0.0.0:9000->9000/tcp
magento2_redis_1           docker-entrypoint.sh redis ...   Up      0.0.0.0:6379->6379/tcp
```
Note: You will see something slightly different if you do not clone the repository into a `magento2` directory.
The container prefix depends on your directory name.
