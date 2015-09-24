# docker-redis

A [Docker](https://docker.com/) container for [Redis](http://redis.io/).

## Run the container

    CONTAINER="redis-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /redis \
      dockerizedrupal/data:1.0.3

    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      --volumes-from redis-data \
      -e TIMEZONE="Etc/UTC" \
      -d \
      dockerizedrupal/redis:1.0.3

## Build the image
      
    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.3 \
      && sudo docker build -t dockerizedrupal/redis:1.0.3 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## License

**MIT**
