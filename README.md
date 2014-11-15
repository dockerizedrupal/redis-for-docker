# docker-redis-2.8.14-dev

A [Docker](https://docker.com/) container for [Redis](http://redis.io/).

## Redis 2.8.14 (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v $(pwd)/.docker/redis-2.8.14/data:/redis-2.8.14/data \
      simpledrupalcloud/data:dev

    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      --volumes-from data \
      -d \
      simpledrupalcloud/redis:2.8.14-dev

Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.8.14-dev \
      && fig up

### Build the image
      
    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.8.14-dev \
      && sudo docker build -t simpledrupalcloud/redis:2.8.14-dev . \
      && cd -

## License

**MIT**
