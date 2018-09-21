# Docker for Magento2 [![Build Status](https://travis-ci.org/EmakinaFR/docker-magento2.svg?branch=master)](https://travis-ci.org/EmakinaFR/docker-magento2) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
This repository allows the creation of a Docker environment that meets
[Magento2](http://devdocs.magento.com/guides/v2.2/install-gde/system-requirements-tech.html) requirements.

## Architecture
![Architecture overview](docs/architecture.png "Architecture")

## Services
* `blackfire`: [blackfire/blackfire:latest](https://hub.docker.com/r/blackfire/blackfire/) image (application profiling).
* `elasticsearch`: [docker.elastic.co/elasticsearch/elasticsearch:5.2.2](https://github.com/EmakinaFR/docker-magento2/blob/master/elasticsearch/Dockerfile) custom image with some plugins (search engine).
* `maildev`: [djfarrelly/maildev:latest](https://hub.docker.com/r/djfarrelly/maildev/) image (emails debugging).
* `mysql`: [mysql:5.7](https://store.docker.com/images/mysql) image (Magento database).
* `nginx`: [nginx:1.15-alpine](https://github.com/EmakinaFR/docker-magento2/blob/master/nginx/Dockerfile) custom image with HTTPS (web server).
* `php` : [php:7.1-fpm-alpine](https://github.com/EmakinaFR/docker-magento2/blob/master/php/Dockerfile) custom image with additional extensions and Composer.
* `redis`: [redis:4-alpine](https://store.docker.com/images/redis) image (Magento session and caches).

## Documentation
> In order to make things more readable, and maintainable, the documentation has been migrated to
the [repository Wiki](https://github.com/EmakinaFR/docker-magento2/wiki). Where you will find all details about the 
installation process along the available instructions for the day-to-day work. 
