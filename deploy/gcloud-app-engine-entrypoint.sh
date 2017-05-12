#!/bin/bash
set -e

# It seems that MYSQL_SOCKET_PATH defined in app.yaml is still not available
# bundle exec rails db:migrate

bundle exec rackup -p $PORT
