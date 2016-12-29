FROM debian:jessie

MAINTAINER Alexandre JARDIN <aja@emakina.fr>

RUN apt-get update \
    && apt-get install -y apt-transport-https curl \
    && curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add - \
    && echo "deb https://repo.varnish-cache.org/debian/ jessie varnish-4.1" | tee -a /etc/apt/sources.list.d/varnish-cache.list \
    && apt-get update \
    && apt-get install -y varnish

CMD ["varnishd", "-a", ":8080", "-T", ":6082", "-f", "/etc/varnish/default.vcl", "-S", "/etc/varnish/secret", "-s", "malloc,256m", "-F"]
