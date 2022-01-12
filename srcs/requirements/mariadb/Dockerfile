FROM alpine:3.13

RUN apk add --update mariadb
RUN rm -rf /var/cache/apk/*

COPY tools/configure.sh configure.sh
ENTRYPOINT ["sh", "configure.sh"]