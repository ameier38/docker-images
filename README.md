# Docker Images

[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/ameier38/ameier38%2Fdocker-images%2Fdotnet-mono-deploy?branch=master&key=eyJhbGciOiJIUzI1NiJ9.NWMzMjE0ODA3YTJkOGI3ZjkxMzVhZjlm.WFn4I6XuUDBfWsKEp6LIuG-IlDsT4JCDTjMzeH7kGu8&type=cf-1)]( https://g.codefresh.io/pipelines/dotnet-mono-deploy/builds?repoOwner=ameier38&repoName=docker-images&serviceName=ameier38%2Fdocker-images&filter=trigger:build~Build;branch:master;pipeline:5c372eddc67fe41c638c9d4d~dotnet-mono-deploy)
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
Deployments are configured in Codefresh and triggered
automatically on merges to `master` branch.

## Other useful images
- [dockersock](https://github.com/Dockins/dockersock/blob/master/Dockerfile)
