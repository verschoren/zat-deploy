# Container image that runs your code
FROM ruby:rc

# Install required libraries
RUN gem install zendesk_apps_tools

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]