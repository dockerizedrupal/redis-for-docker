# docker-redis

A Docker image for [Redis](http://redis.io/) that is used in the [Dockerized Drupal](https://dockerizedrupal.com/) project.

## Run the container

    CONTAINER="redis-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /redis \
      dockerizedrupal/data:1.1.0

    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      --volumes-from redis-data \
      -e TIMEZONE="Etc/UTC" \
      -d \
      dockerizedrupal/redis:1.1.0

## Build the image
      
    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.1.0 \
      && sudo docker build -t dockerizedrupal/redis:1.1.0 . \
      && cd -

## Changing the container behaviour on runtime through environment variables

    // TODO

## License

**MIT**
