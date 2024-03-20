```shell
Docker image for git. 

PREREQUISITES
 - Docker installed

INSTALLATION
 - Docker compose example: 

# Git
  git:
    container_name: git
    image: baroka/git:latest
    restart: "no"
    networks:
      - t2_proxy
    security_opt:
      - no-new-privileges:true
    build:
      context: $DOCKERDIR/git/$GIT_FOLDER
    volumes:
      - $DOCKERDIR/git/lnks:/git
    environment:
      - TZ=$TZ
      - PGID=$PGID
      - PUID=$PUID
      - GIT_EMAIL=$GIT_EMAIL
      - GIT_NAME=$GIT_NAME
      - GIT_TOKEN=$GIT_TOKEN

 - $DOCKERDIR points to your local path with subdirectories with Docker repos
 - $GIT_EMAIL, $GIT_NAME, $GIT_TOKEN. Github parameters
```
