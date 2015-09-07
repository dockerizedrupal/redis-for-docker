#!/usr/bin/env bash

puppet apply --modulepath=/src/redis/build/modules /src/redis/build/build.pp
