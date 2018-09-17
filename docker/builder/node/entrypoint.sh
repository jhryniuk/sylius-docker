#!/bin/bash -e

cd sylius
yarn install
yarn run gulp
rm -rf node_modules
