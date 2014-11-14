# docker-redis-2.8.14

A [Docker](https://docker.com/) container for [Redis](http://redis.io/).

## Redis 2.8.14 (STABLE BRANCH)

### Run the container

Using the `docker` command:
      
    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      -v /var/docker/redis-2.8.14/data:/redis-2.8.14/data \
      -d \
      simpledrupalcloud/redis:2.8.14
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.8.14 \
      && fig up

### Build the image
      
    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.8.14 \
      && sudo docker build -t simpledrupalcloud/redis:2.8.14 . \
      && cd -

## License

**MIT**
