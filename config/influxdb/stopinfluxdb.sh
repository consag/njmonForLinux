pidFile="influxdb.pid"
if [ -f $pidFile ] ; then
   kill $(cat $pidFile)
else
   echo "$(date) pidFile >$pidFile< not found."
fi


