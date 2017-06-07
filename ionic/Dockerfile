FROM ubuntu:16.04

LABEL maintainer "stefanoschrs@hotmail.com"

ENV DEBIAN_FRONTEND=noninteractive

# General
RUN apt-get update && \
    apt-get install -y vim git wget curl unzip ruby python build-essential

# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs

# Yarn 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

# Sass
RUN gem install sass

# Java
RUN apt-get install -y default-jdk gradle

# Android
RUN wget \
      --show-progress \
      "https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" && \
    unzip sdk-tools-linux-3859397.zip -d /opt/android-sdk && \
    rm sdk-tools-linux-3859397.zip
ENV PATH ${PATH}:/opt/android-sdk/tools:/opt/android-sdk/platform-tools


# Ionic
RUN npm i -g ionic cordova
RUN echo y | android update sdk --use-sdk-wrapper -t "build-tools;25.0.3"

WORKDIR app

EXPOSE 8100 35729

CMD ["ionic", "serve"]

