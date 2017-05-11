#!/bin/bash
set -e

echo $CLIENT_SECRET | base64 --decode > ${HOME}/client-secret.json

cat app.sample.yaml | \
sed "s/\[SECRET_KEY_BASE\]/$SECRET_KEY_BASE/g" | \
sed "s/\[DOMAIN_NAME\]/$DOMAIN_NAME/g" | \
sed "s/\[MYSQL_USER\]/$MYSQL_USER/g" | \
sed "s/\[MYSQL_PASSWORD\]/$MYSQL_PASSWORD/g" | \
sed "s/\[MYSQL_DATABASE\]/$MYSQL_DATABASE/g" | \
sed "s/\[MYSQL_INSTANCE_CONNECTION_NAME\]/$MYSQL_INSTANCE_CONNECTION_NAME/g" \
> app.yaml

gcloud --quiet components update app
gcloud auth activate-service-account --key-file ${HOME}/client-secret.json
gcloud config set project $GCLOUD_PROJECT

bundle exec rails assets:precompile
gcloud --quiet app deploy
