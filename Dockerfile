FROM ruby:2.7.0-slim

RUN apt-get update -qq && apt-get install -y curl \
                                             build-essential \
                                             libssl-dev \
                                             libpq-dev \
                                             git \
                                             libgeos-dev \
                                             libproj-dev \
                                             imagemagick \
                                             xvfb \
                                             libfontconfig \
                                             wkhtmltopdf \
                                             zsh

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update -qq

RUN apt-get -y install nodejs --force-yes
RUN apt-get -y install postgresql-client
RUN apt-get -y install vim
RUN apt-get -y --only-upgrade install tzdata

RUN mkdir /app
WORKDIR /app
ADD . /app

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle install
