# Docker Images
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/ameier38/ameier38%2Fdocker-images%2Fdocker-images?branch=master&key=eyJhbGciOiJIUzI1NiJ9.NWMzMjE0ODA3YTJkOGI3ZjkxMzVhZjlm.WFn4I6XuUDBfWsKEp6LIuG-IlDsT4JCDTjMzeH7kGu8&type=cf-1)]( https://g.codefresh.io/pipelines/docker-images/builds?repoOwner=ameier38&repoName=docker-images&serviceName=ameier38%2Fdocker-images&filter=trigger:build~Build;branch:master;pipeline:5c3219d4b131c1db112e6884~docker-images)
___
__Docker Images__ is a collection of custom Docker images (mostly for CI/CD).

## Images
- [dotnet-mono-sdk](./dotnet-mono-sdk/Dockerfile): Image with.NET Core SDK, mono, and fake installed.
- [dind-git-kube-faas](./dind-git-kube-faas/Dockerfile): Image with docker, git, kubectl, and faas installed.

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
