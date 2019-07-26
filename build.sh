#!/bin/bash

scriptdir=$(cd $(dirname $0); pwd)

cd $scriptdir

docker build -t logstash .
