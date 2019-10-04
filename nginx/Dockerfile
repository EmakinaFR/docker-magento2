FROM nginx:1.15-alpine

# Install Nginx requirements
RUN \
    apk add --no-cache shadow && \
    apk add --no-cache --virtual .build-deps openssl && \
    mkdir -p /etc/nginx/ssl && \
    openssl req -subj '/CN=localhost' -days 365 -x509 -newkey rsa:4096 -nodes \
        -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt && \
    apk del .build-deps

# Prepare the directories excluded from the bind-mount
RUN \
    usermod -u 1000 nginx && \
    groupmod -g 1000 nginx && \
    mkdir -p /var/www/html/generated /var/www/html/node_modules /var/www/html/pub/static /var/www/html/vendor && \
    chown -R nginx:nginx /var/www/html/generated /var/www/html/node_modules /var/www/html/pub/static /var/www/html/vendor

WORKDIR /var/www/html/
COPY servers/magento.conf.sample /etc/nginx/conf.d/magento.conf.sample
