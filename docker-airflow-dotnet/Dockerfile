# ameier38/fsharp-airflow

FROM puckel/docker-airflow

USER root

# microsoft/dotnet:2.0-runtime-deps-jessie
# https://raw.githubusercontent.com/dotnet/dotnet-docker/master/2.0/runtime-deps/jessie/amd64/Dockerfile
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        \
# .NET Core dependencies
        libc6 \
        libcurl3 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu52 \
        liblttng-ust0 \
        libssl1.0.0 \
        libstdc++6 \
        libunwind8 \
        libuuid1 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

# Enable detection of running in a container
ENV DOTNET_RUNNING_IN_CONTAINER=true

# microsoft/dotnet:2.0-runtime-jessie
# https://raw.githubusercontent.com/dotnet/dotnet-docker/master/2.0/runtime/jessie/amd64/Dockerfile
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Install .NET Core
ENV DOTNET_VERSION 2.0.7
ENV DOTNET_DOWNLOAD_URL https://dotnetcli.blob.core.windows.net/dotnet/Runtime/$DOTNET_VERSION/dotnet-runtime-$DOTNET_VERSION-linux-x64.tar.gz
ENV DOTNET_DOWNLOAD_SHA d8f6035a591b5500a8b81188d834ed4153c4f44f1618e18857c610d0b332d636970fd8a980af7ae3fbff84b9f1da53aa2f45d8d305827ea88992195cd5643027

RUN curl -SL $DOTNET_DOWNLOAD_URL --output dotnet.tar.gz \
    && echo "$DOTNET_DOWNLOAD_SHA dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

USER airflow
