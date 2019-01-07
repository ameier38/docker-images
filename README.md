# Docker Images

[![pipeline status](https://gitlab.com/ameier38/docker-images/badges/master/pipeline.svg)](https://gitlab.com/ameier38/docker-images/commits/master)
___
__Docker Images__ is a collection of custom Docker images.

## Images
- [dotnet-mono](./dotnet-mono/README.md)

## Build
You can build the images locally by running:
```
> docker-compose build {image-name}
```
Or build all the images by running:
```
> docker-compose build
```

## Deploy
Deployments are configured in GitLab and triggered
automatically on merges to `master` branch.

## Other useful images
- [dockersock](https://github.com/Dockins/dockersock/blob/master/Dockerfile)
