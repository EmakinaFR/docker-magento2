FROM alpine:latest

# Create a new user/group with the same ID than in "nginx" and "php" services
RUN \
    addgroup -g 1000 -S synchro && \
    adduser -u 1000 -D -S -G synchro synchro

CMD ["tail", "-f", "/dev/null"]
