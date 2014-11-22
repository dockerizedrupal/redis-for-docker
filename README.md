# docker-redis

A [Docker](https://docker.com/) container for [Redis](http://redis.io/).

## Redis (STABLE BRANCH)

### Run the container

Using the `docker` command:

    CONTAINER="redisdata" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -v $(pwd)/.docker/redis/data:/redis/data \
      simpledrupalcloud/data:latest

    CONTAINER="redis" && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      --volumes-from redisdata \
      -d \
      simpledrupalcloud/redis:latest
      
Using the `fig` command

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && fig up

### Build the image
      
    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/redis:latest . \
      && cd -

## License

**MIT**
