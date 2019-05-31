#!/bin/bash
period=$1    # in minutes
if [ -z "$period" ] ; then
   period=60
fi
#
interval=$2  # in seconds
if [ -z "$interval" ] ; then
   interval=5
fi
#
pushToInfluxDB=$3  # push to influxdb
if [ -z "$pushToInfluxDB" ] || [ "$pushToInfluxDB" == "N" ] ; then
   echo "$(date) - $0 - Not pushing data to InfluxDB. You might want to do so later on using njmon_to_InfluxDB_injector_15.py"
   push=0
else
   echo "$(date) - $0 - Data will be pushed to InfluxDB using njmon_to_InfluxDB_injector_realtime.py"
   push=1
fi
nrSnapshots=$(( 60 * $period / $interval ))
echo "$(date) - $0 - Capturing for >$period< minutes. interval is >$interval< seconds. nrSnapshots is >$nrSnapshots<."
if [ $push -eq 0 ] ; then
   /appl/njmon/njmon -f -s $interval  -c $nrSnapshots -m /tmp/nmon
else
   /appl/njmon/njmon -s $interval  -c $nrSnapshots | ./njmon_to_InfluxDB_injector_realtime.py
fi

