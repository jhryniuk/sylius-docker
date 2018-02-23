FROM nginx:1.13.5

ADD docker/runner/nginx/php.conf /etc/nginx/conf.d/default.conf

VOLUME /var/www
WORKDIR /var/www

ADD docker/runner/nginx/entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
