# docker-redis

A [Docker](https://docker.com/) container for [Redis](http://redis.io/).

## Run the container

Using the `docker` command:

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
      dockerizedrupal/redis:1.0.1
      
Using the `docker-compose` command

    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.1 \
      && sudo docker-compose up

## Build the image
      
    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 1.0.1 \
      && sudo docker build -t dockerizedrupal/redis:1.0.1 . \
      && cd -

## License

**MIT**
