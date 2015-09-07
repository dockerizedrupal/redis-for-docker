#!/usr/bin/env bash

puppet apply --modulepath=/src/redis/run/modules /src/redis/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
