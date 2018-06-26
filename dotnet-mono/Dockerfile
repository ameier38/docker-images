FROM microsoft/dotnet:2.1-sdk

# allow https (used to get mono repo)
RUN apt update && \
    apt install -y apt-transport-https

# add mono repository (used for paket)
RUN apt-key adv \
        --keyserver hkp://keyserver.ubuntu.com:80 \
        --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/debian stable-stretch main" \
        | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt update
    
# install mono (used for paket)
RUN apt install -y mono-devel

# set locale (https://stackoverflow.com/a/38553499/2108162)
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8 
