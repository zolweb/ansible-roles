#!/bin/sh
set -e

USER=`whoami`

ansible-playbook --sudo debian_base_playbook.yml -i "localhost," -c "local" -vvvv --extra-vars "user=${USER}"

# test export_vars role
if [ "$SYMFONY_CACHE_DIR" != '/dev/shm/cache' ]; then
    echo "Export vars fail: \$SYMFONY_CACHE_DIR is not a env var"
    exit 1
fi
