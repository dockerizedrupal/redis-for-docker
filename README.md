# docker-redis

A [Docker](https://docker.com/) container for [Redis](http://redis.io/).

## Redis 2.8.14 (STABLE)

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

## Redis 2.8.14 (DEVELOPMENT)

### Run the container

Using the `docker` command:
      
    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      -v /var/docker/redis-2.8.14/data:/redis-2.8.14/data \
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
