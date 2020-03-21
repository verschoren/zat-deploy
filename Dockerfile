FROM ubuntu:14.04

# Description
# ===========
# https://github.com/Pindar/docker-zat/blob/master/Dockerfile
# This dockerfile provides you all required tools to run and package Zendesk Apps with 
# zendesk_apps_tools. 

RUN apt-get update -y -qq && \
	apt-get install -y -qq git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties


RUN cd && \
	git clone --depth 1 git://github.com/sstephenson/rbenv.git .rbenv && \
 	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc && \
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc && \
	exec $SHELL && \
	git clone --depth 1 git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build && \
	echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc && \
	exec $SHELL

ENV PATH $HOME/.rbenv/plugins/ruby-build/bin:$PATH
RUN	/root/.rbenv/bin/rbenv install 2.3.8  && \
 	/root/.rbenv/bin/rbenv global 2.3.8

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

RUN /root/.rbenv/shims/gem install zendesk_apps_tools
ENV PATH /root/.rbenv/plugins/ruby-build/bin:/root/.rbenv/shims:/root/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN locale-gen en_US.UTF-8 && export LC_CTYPE=en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN curl -sL https://deb.nodesource.com/setup | sudo bash - && \
	 apt-get install -y nodejs
EXPOSE 4567	 
WORKDIR /data

# Container image that runs your code
# FROM ruby:rc
# 
# Install required libraries
# RUN gem install zendesk_apps_tools

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]