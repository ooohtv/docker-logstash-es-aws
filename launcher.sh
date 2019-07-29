#!/bin/sh

# Hack the substition of the ES_HOST variable into the configuration to work around a logstash bug.
# All other environment variable substitutions work as expected
sed -i"" "s/\${ES_HOST}/$ES_HOST/" /usr/share/logstash/pipeline/logstash.conf

echo ""
echo "Hacked ES_HOST into logstash.conf. Updated file:"
cat /usr/share/logstash/pipeline/logstash.conf
echo ""

# Run logstash as normal with the hacked configuration
exec logstash -f /usr/share/logstash/pipeline/logstash.conf
