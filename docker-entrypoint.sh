#!/bin/sh
set -e

if [ "$1" = 'serve' ]; then
  # SERVE
  cd /mkdocs
  exec mkdocs serve
fi

if [ "$1" = 'build' ]; then
  # BUILD
  cd /mkdocs
  exec mkdocs build
fi

exec "$@"
