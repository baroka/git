# build:
#  docker build -t baroka/git .

FROM alpine:latest

VOLUME /git
WORKDIR /work

# Copy entrypoint script
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh

WORKDIR /bin

# Copy git script
COPY git-update.sh .
RUN chmod a+x git-update.sh

# Install packages
RUN apk update && apk add --no-cache git git-lfs less openssh && \
    git lfs install

# Timezone
RUN apk update && apk add tzdata
ENV TZ=Europe/Madrid
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime

# Create the log file to be able to run tail
RUN touch /var/log/git.log

WORKDIR /git

# Run the command on container startup
ENTRYPOINT ["/work/entrypoint.sh"]