FROM alpine

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker
COPY --from=openfaas/faas-cli:0.8.2 /usr/bin/faas-cli /usr/local/bin/faas

RUN apk add --no-cache git openssh-client

RUN apk add --update ca-certificates \
    && apk add --update -t deps curl \
    && curl -L https://storage.googleapis.com/kubernetes-release/release/v1.10.11/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && apk del --purge deps \
    && rm /var/cache/apk/*

RUN kubectl --help
RUN docker --help
RUN faas --help
