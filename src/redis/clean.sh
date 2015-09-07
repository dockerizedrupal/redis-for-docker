#!/usr/bin/env bash

puppet apply --modulepath=/src/redis/clean/modules /src/redis/clean/clean.pp
