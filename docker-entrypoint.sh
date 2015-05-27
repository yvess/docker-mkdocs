#!/bin/sh
set -e
cd /mkdocs

if [ "$1" = 'serve' ]; then
  # BUILD
  exec mkdocs serve
fi
exec "$@"
