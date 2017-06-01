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

cat deploy/docker-build-secrets-sample | sed \
  -e "s/\[SECRET_KEY_BASE\]/$SECRET_KEY_BASE/g" \
  -e "s/\[DOMAIN_NAME\]/$DOMAIN_NAME/g" \
> deploy/docker-build-secrets

# Overwrite Dockerfile, for gcloud app deploy
cp deploy/Dockerfile Dockerfile

gcloud auth activate-service-account --key-file ${HOME}/client-secret.json
gcloud config set project $GCLOUD_PROJECT
PROMOTE_FLAG="--no-promote"
if [ "$APP_VERSION" = "master" ]; then
  PROMOTE_FLAG="--promote"
fi
echo APP_VERSION:$APP_VERSION

# Start the service if it is stopped
gcloud app versions describe $APP_VERSION --service=default | grep "servingStatus: SERVING" || \
    gcloud --quiet app versions start $APP_VERSION

gcloud --quiet app deploy --version=$APP_VERSION $PROMOTE_FLAG
