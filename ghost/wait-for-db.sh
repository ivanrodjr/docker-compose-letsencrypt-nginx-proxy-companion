#!/bin/bash
set -e
host="$1"
shift
cmd="$@"
until mysql -h${database__connection__host} -p"3306" -u"${database__connection__user}" -p"${database__connection__password}" "${database__connection__database}";
do
  >&2 echo "MySQL is up but ${database__connection__database} database is not initialized yet. SLEEPING"
  sleep 1
done
>&2 echo "The ${database__connection__database} database is now initialized and available for connections - EXECUTING GHOST"
exec "$@"