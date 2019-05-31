#!/bin/bash
. ./influxdb_env.sh
nohup ./influxd run -pidfile $INSTALLDIR/influxdb.pid &


