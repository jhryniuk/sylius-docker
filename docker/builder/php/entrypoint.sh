#!/bin/bash -e

sleep 10;
composer create-project sylius/sylius-standard sylius

cd sylius

sed -i 's/env(SYLIUS_DATABASE_HOST): 127.0.0.1/env(SYLIUS_DATABASE_HOST): mysql/g' app/config/parameters.yml
sed -i "s/env(SYLIUS_DATABASE_NAME): sylius/env(SYLIUS_DATABASE_NAME): ${PROJECT_NAME}/g" app/config/parameters.yml
sed -i "s/env(SYLIUS_DATABASE_PASSWORD): null/env(SYLIUS_DATABASE_PASSWORD): ${MYSQL_PASSWORD}/g" app/config/parameters.yml

php bin/console doctrine:database:create -e prod
php bin/console doctrine:database:create -e dev
php bin/console doctrine:database:create -e test

php bin/console sylius:install -e prod -n
php bin/console sylius:install -e dev -n
php bin/console sylius:install -e test -n

php bin/console sylius:install:assets
php bin/console cache:clear --no-warmup
