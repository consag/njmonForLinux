. ./grafana_env.sh
if [ -f $pidFile ] ; then
   kill $(cat $pidFile)
   rm $pidFile
else
   echo "Grafana pidFile >$pidFile< not found."
fi

