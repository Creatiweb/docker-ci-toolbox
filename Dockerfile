FROM docker:17
# up to 2017
#MAINTAINER Fabio Todaro <fbregist@gmail.com>
# 2018
MAINTAINER Massimiliano Ferrero <m.ferrero@cognitio.it>

# gcloud
ARG CLOUD_SDK_VERSION=219.0.1
ENV CLOUD_SDK_VERSION=$CLOUD_SDK_VERSION

ENV PATH /google-cloud-sdk/bin:$PATH
RUN apk --no-cache add \
        curl \
        python \
        py-crcmod \
        bash \
        libc6-compat \
        openssh-client \
        git \
        gnupg \
    && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version

# Install dependencies
RUN apk add --update --no-cache \
    bash \
    curl \
    ruby-json \
    libffi-dev \
    alpine-sdk \
    ruby \
    ruby-dev \
    ruby-io-console \
    zlib-dev \
    openssh \
    jq \
    groff \
    py-pip \
    python && \
    echo 'gem: --no-document' > ~/.gemrc

# Install AWS-CLI
RUN pip install --upgrade \
    pip \
    awscli

# Install Chef
RUN gem install chef

# Install Berkshelf
RUN USE_SYSTEM_GECODE=1 gem install berkshelf

# Install Chef Testing tools
RUN gem install rake foodcritic cookstyle

# Clean
RUN gem sources -c

COPY scripts/* /usr/local/bin/

RUN chmod a+x /usr/local/bin/*
