# njmon For Linux and Informatica
Slightly adjusted njmon for easier Informatica process monitoring using InfluxDB and Grafana

## Modifications
- Informatica uses many java and pmdtm/pmdtmsvc2 processes. For ease of monitoring it was better to not mark each process with its own identifier, eg. java_16736 and pmdtmsvc2_3552, but remove the Pid. It is then easier to write your query in InfluxDB or graphing the results in Grafana as you don't need additional processing in InfluxDB to get all java processes or all Informatica processes in one single result set.

## Grafrana Template
- Modified so it is now based on Linux terminology
- Removed all AIX specifics
- Added Informatica graphs for java and pmdtm/pmdtmsv2 processes
- Added panel for current CPU, Memory, Disk I/O

# njmon original source code
The original njmon source code is maintained by Nigel Griffiths on http://nmon.sourceforge.net/pmwiki.php?n=Site.Njmon

## License provided code
* The code provided in this repository falls under the MIT license, check https://opensource.org/licenses/MIT for more info

## Licenses referenced and other code
* Check nmon.sourceforge.net for license info about njmon
* InfluxDB is open source and licensed under the MIT license, check https://github.com/influxdata/influxdb/blob/master/LICENSE for more info
* Grafana is open source and licensed under the Apache License 2.0, check https://github.com/grafana/grafana/blob/master/LICENSE for more info
