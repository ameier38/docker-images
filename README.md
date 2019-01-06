# Docker Images
Collection of custom Docker images.

## Images
- [dotnet-mono](./dotnet-mono/README.md)
- [docker-ci](./docker-ci/README.md)

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
Deployments are configured in DockerHub and triggered
automatically on tagged releases to `master` branch.

### Other useful images
- [dockersock](https://github.com/Dockins/dockersock/blob/master/Dockerfile)
