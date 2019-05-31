#!/bin/bash
. ./njmon_env.sh

if [ "$1" == "help" ] ; then
   echo "usage: $0 <period_in_minutes> <interval_in_seconds> <pushToInfluxDB>"
   echo "  where:"
   echo "  <period_in_minutes> = period to monitor the system"
   echo "  <interval_in_seconds> = interval between snapshots (in seconds)"
   echo "  <pushToInfluxDB> : if N will not push to InfluxDB, else will do"
   exit 0
fi

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
   $NJMON_INSTALLDIR/njmon -P -k -f -s $interval  -c $nrSnapshots -m /tmp/nmon
else
   $NJMON_INSTALLDIR/njmon -P -k -s $interval  -c $nrSnapshots | ./njmon_to_InfluxDB_injector_realtime.py
fi

