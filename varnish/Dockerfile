FROM debian:stretch

MAINTAINER Alexandre JARDIN <aja@emakina.fr>
LABEL maintainer="Alexandre JARDIN <aja@emakina.fr>"

# Install Varnish requirements
RUN \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends curl && \
    curl -s https://packagecloud.io/install/repositories/varnishcache/varnish5/script.deb.sh | bash && \
    apt-get install -y --no-install-recommends varnish && \
    rm -rf /var/lib/apt/lists/*

# Install custom Varnish configuration
COPY default.vcl /etc/varnish/default.vcl

CMD ["-s", "malloc,256m", "-F"]
ENTRYPOINT ["varnishd", "-a", ":8080", "-T", ":6082", "-f", "/etc/varnish/default.vcl", "-S", "/etc/varnish/secret"]
