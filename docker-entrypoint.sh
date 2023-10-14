#!/bin/sh
set -e # fail the whole script if any command fails

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# execute the command the will follow this script
exec "$@"