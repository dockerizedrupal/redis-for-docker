docker-redis-2.8.14
===================

Run the container
-----------------

    CONTAINER=redis && sudo docker run \
      --name "${CONTAINER}" \
      -h "${CONTAINER}" \
      -p 6379:6379 \
      -v /var/redis-2.8.14/data:/redis-2.8.14/data \
      -d \
      simpledrupalcloud/redis:2.8.14

Build the image
---------------

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git "${TMP}" \
      && cd "${TMP}" \
      && git checkout 2.8.14 \
      && sudo docker build -t simpledrupalcloud/redis:2.8.14 . \
      && cd -
