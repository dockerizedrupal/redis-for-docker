# redis-for-docker

A Docker image for [Redis](http://redis.io/).

## Run the container

    CONTAINER="redis-data" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v /redis \
      --entrypoint /bin/echo \
      dockerizedrupal/redis:2.0.0 "Data-only container for Redis."

    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      --volumes-from redis-data \
      -e TIMEZONE="Etc/UTC" \
      -d \
      dockerizedrupal/redis:2.0.0

## Build the image
      
    TMP="$(mktemp -d)" \
      && git clone https://github.com/dockerizedrupal/redis-for-docker.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.0.0 \
      && sudo docker build -t dockerizedrupal/redis:2.0.0 . \
      && cd -

## License

**MIT**
