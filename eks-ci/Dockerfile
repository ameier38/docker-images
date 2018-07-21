FROM python:3-alpine

WORKDIR /app

RUN apk --no-cache add curl \ 
    && echo "Pulling awscli binary." \
    && curl -sSL https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/kubectl > /app/kubectl
    && chmod +x /app/kubectl \
    && curl -sSL https://amazon-eks.s3-us-west-2.amazonaws.com/1.10.3/2018-06-05/bin/linux/amd64/heptio-authenticator-aws > /app/heptio-authenticator-aws
    && chmod +x /app/heptio-authenticator-aws
    && apk del curl --no-cache

RUN pip install awscli --upgrade
