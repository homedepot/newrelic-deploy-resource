#!/bin/sh

docker build --no-cache -t newrelic-deploy-resoource .
docker tag -f slack-notify-resource 192.168.59.103:5000/newrelic-deploy-resoource
docker push 192.168.59.103:5000/newrelic-deploy-resoource