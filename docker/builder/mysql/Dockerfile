FROM mysql:5.7

ARG USERID="${USERID}"

RUN usermod -u $USERID mysql && \
    chown mysql:mysql -R /var/lib/mysql

USER mysql
