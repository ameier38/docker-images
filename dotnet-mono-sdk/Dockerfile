FROM buildpack-deps:stretch-scm

# Install .NET CLI dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu57 \
        liblttng-ust0 \
        libssl1.0.2 \
        libstdc++6 \
        zlib1g \
    && rm -rf /var/lib/apt/lists/*

RUN curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/release/2.1.6xx/dotnet-sdk-latest-linux-x64.tar.gz \
    && dotnet_sha512='283AEA503B1F31F2437363E10301D45C903E89CA8CE93449B5A1F07F52669C13B03C7C8D0C5CCA493F2B606B7DB91181B53CEE2E9234427D904649058649B448' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# Configure web servers to bind to port 80 when present
ENV ASPNETCORE_URLS=http://+:80 \
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps performance
    NUGET_XMLDOC_MODE=skip

# Trigger first run experience by running arbitrary cmd to populate local package cache
RUN dotnet help

ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

# allow https (used to get mono repo)
RUN apt update \
    && apt install --no-install-recommends -y apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# add mono repository (used for paket)
RUN apt-key adv \
        --no-tty \
        --keyserver hkp://keyserver.ubuntu.com:80 \
        --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/debian stable-stretch main" \
        | tee /etc/apt/sources.list.d/mono-official-stable.list
    
# install mono (used for paket)
RUN apt update \
    && apt install --no-install-recommends -y mono-devel \
    && rm -rf /var/lib/apt/lists/*

# install FAKE
RUN dotnet tool install fake-cli -g
ENV PATH="/root/.dotnet/tools:${PATH}"

# set locale (https://stackoverflow.com/a/38553499/2108162)
RUN apt update \
    && DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y locales \
    && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 

# test image
RUN dotnet --help
RUN fake --help
RUN mono --help
