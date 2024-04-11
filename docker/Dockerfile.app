FROM debian:bookworm-slim as build

RUN apt-get update && \
    apt-get install -y git unzip zip curl build-essential zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN cd /opt && \
    curl -L https://download.oracle.com/graalvm/21/latest/graalvm-jdk-21_linux-x64_bin.tar.gz \
      --output graalvm-jdk-21_linux-x64_bin.tar.gz && \
    mkdir /opt/graalvm && \
    tar xf graalvm-jdk-21_linux-x64_bin.tar.gz -C graalvm --strip-components 1&& \
    rm -f graalvm-jdk-21_linux-x64_bin.tar.gz

ARG MAVEN_VERSION=3.9.6

RUN cd /opt && \
    curl -L https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
      --output apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    mkdir /opt/maven && \
    tar xf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C maven --strip-components 1 && \
    rm -f apache-maven-${MAVEN_VERSION}-bin.tar.gz

ARG MN_VERSION=4.3.7

RUN cd /opt && \
    curl -L https://github.com/micronaut-projects/micronaut-starter/releases/download/v${MN_VERSION}/micronaut-cli-${MN_VERSION}.zip \
        --output micronaut-cli-${MN_VERSION}.zip && \
    unzip micronaut-cli-${MN_VERSION}.zip && \
    rm micronaut-cli-${MN_VERSION}.zip && \
    mv micronaut-cli-${MN_VERSION} micronaut

ENV PATH="${PATH}:/opt/graalvm/bin:/opt/maven/bin:/opt/micronaut/bin"
ENV JAVA_HOME="/opt/graalvm"

ARG FIX_UID
ARG FIX_GID

ARG DOCKER_USER=bob
ARG DOCKER_GROUP=bob

RUN addgroup --gid 1000 bob && \
    adduser --ingroup bob --uid 1000 --disabled-password bob 

ADD docker/fix-perm.sh /fix-perm.sh
RUN chmod +x /fix-perm.sh && /fix-perm.sh

USER bob
