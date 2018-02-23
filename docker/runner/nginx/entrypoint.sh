#!/bin/bash

sed -i "s/__PROJECT_NAME__/${PROJECT_NAME}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__ROOT_DIR__/${ROOT_DIR}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__INDEX_FILE__/${INDEX_FILE}/g" /etc/nginx/conf.d/default.conf
sed -i "s/__INDEX_DEV_FILE__/${INDEX_DEV_FILE}/g" /etc/nginx/conf.d/default.conf

/usr/sbin/nginx -g "daemon off;"
