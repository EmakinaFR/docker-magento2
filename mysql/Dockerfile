FROM mysql:5.7

# Override default value to allow to load bigger file
RUN echo 'max_allowed_packet=256M' >> /etc/mysql/conf.d/docker.cnf
RUN echo 'innodb_flush_log_at_trx_commit=2' >> /etc/mysql/conf.d/docker.cnf
