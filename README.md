# docker-redis

A [Docker](https://docker.com/) container for [Redis](http://redis.io/).

## Redis (DEVELOPMENT BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="redisdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /redis/data \
      simpledrupalcloud/data:dev

    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      --volumes-from redisdata \
      -d \
      simpledrupalcloud/redis:dev
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && fig up

### Build the image
      
    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout dev \
      && sudo docker build -t simpledrupalcloud/redis:dev . \
      && cd -

## License

**MIT**
