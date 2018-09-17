#!/usr/bin/env bash

TASK_NAME=$1;

FILES=(
    'definedVariables.sh'
)

for FILE in "${FILES[@]}" ; do
    source "bash/${FILE}"
done

definedVariables


function elementExists
{
    array=${1}[@]
    element=${2}

    for i in ${!array} ; do
        if [[ $i == $element ]] ; then
            return 0
        fi
    done

    return 1
}

function helper
{
    echo -e "'build-builder-images' - will build builder images"
    echo -e "'build-project' - will build project"
    echo -e "'build-runner' - will build runner images"
    echo -e "'run-runner' - will run project"
    echo -e "'kill-runner' - will kill and remove runner containers"
    echo -e "'enter <service>' - will enter to runner container"
}

function build_builder_images
{
    docker pull mysql:5.7
    docker-compose -f docker-compose-builder.yml build
}

function build_project
{
    docker-compose -f docker-compose-builder.yml up php
    docker-compose -f docker-compose-builder.yml up node
    docker-compose -f docker-compose-builder.yml kill
}

function build_runner
{
    docker-compose -f docker-compose.yml build
}

function run_runner
{
    docker-compose -f docker-compose.yml up -d
}

function kill_runner
{
    docker-compose -f docker-compose.yml kill
    docker-compose -f docker-compose.yml rm -f
}

function enter_to_container
{
    container=$1

    elementExists docker_runner_containers "${container}" && found=true  || found=false

    if [ ${found} != true ] ; then
        echo -e "Wrong service"
        echo -e "Available services:"
        printf '%s\t' "${docker_runner_containers[@]}"
        printf '\n'
    else
        docker-compose -f docker-compose.yml exec "${container}" bash
    fi
}

case $TASK_NAME in
    'build-builder-images')
        build_builder_images
        ;;
    'build-project')
        build_project
        ;;
    'build-runner')
        build_runner
        ;;
    'run-runner')
        run_runner
        ;;
    'kill-runner')
        kill_runner
        ;;
    'enter')
        enter_to_container $2
        ;;
    *)
        helper
        ;;
esac
