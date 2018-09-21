FROM nginx:1.15-alpine

# Install HTTPS requirements
RUN \
    apk add --no-cache --virtual .build-deps \
        openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -subj '/CN=localhost' -days 365 -x509 -newkey rsa:4096 -nodes \
        -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt && \
    apk del .build-deps

WORKDIR /var/www/html/
COPY servers/magento.conf.sample /etc/nginx/conf.d/magento.conf.sample
