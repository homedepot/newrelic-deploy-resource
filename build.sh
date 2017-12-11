#!/bin/sh

docker build --no-cache -t newrelic-deploy-resource .
docker tag -f @channel We are planning on pushing Orange Pay to QA. We are in the works of setting up a confluence page that will include information about integrating changes like this in the future. In the meantime, refer to the attached document. In the documentation you will find information about the new callbacks that will need to be implemented by all clients. 192.168.59.103:5000/newrelic-deploy-resoource
docker push 192.168.59.103:5000/newrelic-deploy-resoource
