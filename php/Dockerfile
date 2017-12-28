FROM php:7.1-fpm

MAINTAINER Alexandre JARDIN <aja@emakina.fr>
LABEL maintainer="Alexandre JARDIN <aja@emakina.fr>"

# Install Magento requirements
RUN \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
        bzip2 \
        git \
        libcurl4-openssl-dev \
        libicu-dev \
        libfreetype6-dev \
        libjpeg-dev \
        libmcrypt-dev \
        libpng-dev \
        libxml2-dev \
        libxslt-dev \
        ssmtp && \
    docker-php-ext-configure bcmath && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install -j$(nproc) \
        bcmath \
        gd \
        intl \
        mcrypt \
        opcache \
        pdo_mysql \
        soap \
        xsl \
        zip && \
    perl -pi -e "s/mailhub=mail/mailhub=maildev/" /etc/ssmtp/ssmtp.conf && \
    usermod -u 1000 www-data && \
    curl -sS https://deb.nodesource.com/setup_9.x | bash && \
    apt-get install -y --no-install-recommends nodejs && \
    npm install -g grunt-cli && \
    rm -rf /var/lib/apt/lists/*

# Install Blackfire extension
RUN \
    version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;") && \
    curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/"${version}" && \
    tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp && \
    mv /tmp/blackfire-*.so $(php -r "echo ini_get('extension_dir');")/blackfire.so

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Install Magerun globally
RUN curl -O https://files.magerun.net/n98-magerun2.phar && \
    chmod +x n98-magerun2.phar && \
    mv n98-magerun2.phar /usr/local/bin/magerun

# Install custom PHP configuration
COPY custom.ini /usr/local/etc/php/conf.d/

# Install custom entrypoint
COPY ./entrypoint.sh /usr/local/bin/docker-custom-entrypoint
RUN chmod 777 /usr/local/bin/docker-custom-entrypoint
ENTRYPOINT ["docker-custom-entrypoint"]
