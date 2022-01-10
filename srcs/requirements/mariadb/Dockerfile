FROM alpine:3.13

RUN apk add --update mysql
RUN rm -rf /var/cache/apk/*

ENV MYSQL_ROOT_PASSWORD root
ENV MYSQL_DATABASE wordpress
ENV MYSQL_USER admin
ENV MYSQL_PASSWORD admin

COPY tools/configure.sh configure.sh
CMD ["sh", "configure.sh"]