#! /bin/bash
curl -G http://$influx_ip:$influx_port/query --data-urlencode 'q=CREATE DATABASE "netdevops" WITH DURATION 2d'
curl -G http://$influx_ip:$influx_port/query?q=CREATE+USER+%22cisco%22+WITH+PASSWORD+'cisco'&db=_internal
curl -G http://$influx_ip:$influx_port/query --data-urlencode 'q=GRANT ALL ON netdevops TO cisco'
#./pipeline -config=data/config/pipeline.conf_REWRITTEN -pem=./id_rsa -log= -debug
./pipeline -config=/etc/pipeline/pipeline.conf -pem=/etc/pipeline/id_rsa -log= -debug
