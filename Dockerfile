# build:
#  docker build -t baroka/git .

FROM alpine:latest

WORKDIR /bin

# Install packages
RUN apk update && apk add --no-cache git git-lfs less openssh && \
    git lfs install && \
    rm -rf /tmp/*

# Timezone
RUN apk update && apk add tzdata
ENV TZ=Europe/Madrid
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime

WORKDIR /work

# Copy entrypoint script
COPY entrypoint.sh .
RUN chmod a+x entrypoint.sh

WORKDIR /git

# Run the command on container startup
ENTRYPOINT ["/work/entrypoint.sh"]