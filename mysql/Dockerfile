FROM ajardin/magento2-mysql:latest

# Override default value to allow to load bigger file
RUN echo 'innodb_flush_log_at_trx_commit=2' >> /etc/mysql/conf.d/docker.cnf
