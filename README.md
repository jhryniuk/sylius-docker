Sylius-docker
============
### Project description:

This project is created in order to simplify create projects based on Sylius.

### Project requirements:

1. Docker,
2. docker-compose,

### Recommended OS:
Linux Ubuntu 16.04

### Commands:

Bash script named `docker.sh` is created in order to run most important commands in the project

```bash
'build-builder-images' - will build builder images
'build-project' - will build project
'build-runner' - will build runner images
'run-runner' - will run project
'kill-runner' - will kill and remove runner containers
```

### Usage:
1. Download project from repository,
2. Go inside project folder,
3. In order to build builder images run command `./docker.sh build-builder-images`,
4. Rest of commands from the list above you can use the same way.
