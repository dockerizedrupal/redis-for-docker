docker-redis-2.8.14
===================

Run the container
-----------------

    sudo docker run \
      --name redis2814 \
      --net host \
      -v /var/redis-2.8.14/data:/redis-2.8.14/data \
      -d \
      simpledrupalcloud/redis:2.8.14

Build the image yourself
------------------------

    git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-redis.git docker-redis
    cd docker-redis
    git checkout 2.8.14
    sudo docker build -t simpledrupalcloud/redis:2.8.14 .