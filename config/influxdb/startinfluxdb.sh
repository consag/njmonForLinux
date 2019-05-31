#!/bin/bash
INSTALLDIR=/appl/influxdb/current
INFLUXDB_CONFIG_PATH=${INSTALLDIR}/influxdb.conf
export INFLUXDB_CONFIG_PATH
nohup ./influxd run -pidfile $INSTALLDIR/influxdb.pid &


