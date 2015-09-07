#!/usr/bin/env bash

case "${1}" in
  build)
    /bin/su - root -mc "apt-get update && /src/redis/build.sh && /src/redis/clean.sh"
    ;;
  run)
    /bin/su - root -mc "source /src/redis/variables.sh && /src/redis/run.sh"
    ;;
esac
