#!/usr/bin/env bash

if [ -z "${TIMEZONE}" ]; then
  TIMEZONE="Etc/UTC"
fi

export FACTER_TIMEZONE="${TIMEZONE}"
