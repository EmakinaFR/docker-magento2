FROM nginx:latest

MAINTAINER Alexandre JARDIN <aja@emakina.fr>
LABEL maintainer="Alexandre JARDIN <aja@emakina.fr>"

# Install custom Nginx configuration
COPY nginx.conf /etc/nginx/
COPY servers/* /etc/nginx/conf.d/
