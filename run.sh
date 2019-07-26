#!/bin/bash

scriptdir=$(cd $(dirname $0); pwd)

if [[ ! -f $scriptdir/run.env ]] ;then
	echo "Missing 'run.env' file. You may create one by copying the 'run.env.template' file"
	echo "and updating the values to match your environment's configuration."
	exit 1
fi

docker run --rm -it --env-file $scriptdir/run.env -p 5000:5000 logstash	