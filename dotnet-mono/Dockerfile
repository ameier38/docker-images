FROM microsoft/dotnet:2.2-sdk

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
    && apt install --no-install-recommends -y mono-devel fsharp \
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
