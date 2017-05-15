#!/bin/bash
set -e

echo $CLIENT_SECRET | base64 --decode > ${HOME}/client-secret.json

cat app.sample.yaml | sed \
  -e "s/\[RAILS_ENV\]/$RAILS_ENV/g" \
  -e "s/\[SECRET_KEY_BASE\]/$SECRET_KEY_BASE/g" \
  -e "s/\[DOMAIN_NAME\]/$DOMAIN_NAME/g" \
  -e "s/\[MYSQL_USER\]/$MYSQL_USER/g" \
  -e "s/\[MYSQL_PASSWORD\]/$MYSQL_PASSWORD/g" \
  -e "s/\[MYSQL_DATABASE\]/$MYSQL_DATABASE/g" \
  -e "s/\[MYSQL_INSTANCE_CONNECTION_NAME\]/$MYSQL_INSTANCE_CONNECTION_NAME/g" \
> app.yaml

cp config/secrets.sample.yml config/secrets.yml

cp deploy/dockerignore .dockerignore
cat deploy/Dockerfile | sed \
  -e "s/\[SECRET_KEY_BASE\]/$SECRET_KEY_BASE/g" \
  -e "s/\[DOMAIN_NAME\]/$DOMAIN_NAME/g"
> Dockerfile

gcloud auth activate-service-account --key-file ${HOME}/client-secret.json
gcloud config set project $GCLOUD_PROJECT
gcloud config set app/promote_by_default false

echo APP_VERSION:$APP_VERSION
gcloud --quiet app deploy --version=$APP_VERSION
