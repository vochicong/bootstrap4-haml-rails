#!/bin/bash
set -e

bundle exec rails db:migrate
bundle exec rackup -p $PORT
