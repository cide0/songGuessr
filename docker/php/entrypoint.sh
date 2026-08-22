#!/bin/sh
if [ -f /var/www/html/.env ]; then
  set -a
  . /var/www/html/.env
  set +a
fi
exec docker-php-entrypoint "$@"
