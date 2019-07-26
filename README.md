# Docker Logstash with amazon ES plugin

A simple container that runs a logstash instance with the aws amazon plugin, with some additional configuration
to support connections from JHipster microservices

## Environment variables 

The following environment variables should be passed to the docker container to configure the connection
to the Amazon ElasticSearch domain

ES_HOST     -  ElasticSearch AWS endpoint  
AWS_REGION  -  AWS region where is your ES  
ACCESS_KEY  -  Access key ID of IAM user with access to ES domain
SECRET_KEY  -  Secret key of IAM user with access to ES domain
ENVIRONMENT -  Environment name to create and index in ES as ENVIRONMENT-logs-DATE where DATE is the current date

The following environment variables may be passed to the docker container to match the values used in the JHipster
microservice configuration

INPUT_UDP_PORT - default 5000
INPUT_TCP_PORT - default 5000
INPUT_HTTP_PORT - default 5001

## Build

```
$ ./build.sh
```
## Test

To test locally, you must copy the `run.env.template` file to `run.env` and update the values in the file to 
reflect the configuration of the target Amazon ES domain.

```
$ ./run.sh
```

You may then start a JHipster microservice with the default logstash configuration and verify the log statements appear
in the target Amazon ES domain

## Deploy

To deploy the image, log into your dockerhub account, tag the image in the local repo, then push it to a dockerhub registry

```
$ docker login --username=yourhubusername
```

List the images in the local registry

```
$ docker images
```

Tag the logstash image

```
$ docker tag logstash:latest yourhubusername/logstash:7.2.0.0
```

Push the image to dockerhub

```
$ docker push yourhubusername/logstash
```


