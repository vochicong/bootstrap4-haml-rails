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

# Update gcloud (need sudo for now)
sudo /opt/google-cloud-sdk/bin/gcloud --quiet components update
sudo chmod 757 /home/ubuntu/.config/gcloud/logs -R

gcloud auth activate-service-account --key-file ${HOME}/client-secret.json
gcloud config set project $GCLOUD_PROJECT
gcloud config set app/promote_by_default false

bundle exec rails assets:precompile

APP_VERSION=`echo $CIRCLE_BRANCH | sed "s/_/-/g"`
gcloud --quiet app deploy --version=$APP_VERSION
