FROM php:7.0-fpm

MAINTAINER Alexandre JARDIN <aja@emakina.fr>

RUN apt-get update \
    && apt-get install -y \
        git \
        libcurl4-openssl-dev \
        libicu-dev \
        libfreetype6-dev \
        libjpeg-dev \
        libmemcached-dev \
        libmcrypt-dev \
        libpng-dev \
        libxml2-dev \
        libxslt-dev \
	sendmail \
    && docker-php-ext-configure bcmath \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        curl \
        gd \
        hash \
        iconv \
        intl \
        json \
        mbstring \
        mcrypt \
        opcache \
        pdo_mysql \
        simplexml \
        soap \
        xml \
        xsl \
        zip \
    && rm -rf /var/lib/apt/lists/* \
    && touch /usr/local/etc/php/custom.ini

RUN apt-get update \
    && apt-get install -y bzip2 \
    && curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g grunt-cli

ADD sendmailhosts.sh /home/sendmailhosts.sh

RUN usermod -u 1000 www-data

CMD sh /home/sendmailhosts.sh && /etc/init.d/sendmail start && sendmailconfig
