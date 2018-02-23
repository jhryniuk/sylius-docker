#!/usr/bin/env bash

function definedVariables
{
    export PROJECT_NAME="$(basename $PWD)"
    export MYSQL_PASSWORD='Zxcvbn1!'
    export INDEX_FILE='app.php'
    export INDEX_DEV_FILE='app_dev.php'
    export ROOT_DIR='\/var\/www\/web'
    export USERID="$(id -u)"
}
