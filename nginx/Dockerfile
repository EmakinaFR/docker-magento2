FROM nginx:latest

MAINTAINER Alexandre JARDIN <aja@emakina.fr>

COPY extra/*.conf /etc/nginx/conf.d/

RUN usermod -u 1000 www-data
