# Container image that runs the code
FROM alpine/curl:3.14

# Install bash
RUN apk add --no-cache bash

# Copies the code file from the repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
