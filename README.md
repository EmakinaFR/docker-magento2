# Docker for Magento2 [![CircleCI](https://circleci.com/gh/EmakinaFR/docker-magento2.svg?style=svg)](https://circleci.com/gh/EmakinaFR/docker-magento2) [![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
This repository allows the creation of a Docker environment that meets
[Magento 2](https://devdocs.magento.com/guides/v2.4/install-gde/system-requirements-tech.html) requirements.

## Architecture
![Architecture overview](docs/architecture.png "Architecture")

## Services
* `blackfire`: [blackfire/blackfire:2](https://hub.docker.com/r/blackfire/blackfire/) image (application profiling).
* `elasticsearch`: [ajardin/magento2-elasticsearch](https://hub.docker.com/r/ajardin/magento2-elasticsearch) custom image with some plugins (search engine).
* `maildev`: [maildev/maildev](https://hub.docker.com/r/maildev/maildev/) image (emails debugging).
* `mysql`: [mysql](https://hub.docker.com/r/mysql/mysql) image (Magento database).
* `nginx`: [ajardin/magento2-nginx](https://hub.docker.com/r/ajardin/magento2-nginx) custom image with HTTPS (web server).
* `php` : [ajardin/php](https://hub.docker.com/r/ajardin/php) custom image with additional extensions and Composer.
* `redis`: [redis](https://store.docker.com/images/redis) image (Magento session and caches).

## Documentation
> In order to make things more readable, and maintainable, the documentation has been migrated to
the [repository Wiki](https://github.com/EmakinaFR/docker-magento2/wiki). Where you will find all details about the 
installation process along the available instructions for the day-to-day work. 

