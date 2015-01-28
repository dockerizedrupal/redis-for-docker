#!/usr/bin/env bash

puppet apply --modulepath=/src/run/modules /src/clean/run.pp

/usr/bin/supervisord
