
rm -f /var/run/telegraf/telegraf.pid
/etc/init.d/telegraf start
/etc/init.d/grafana-server restart
cd /work/prometheus-2.15.2.linux-arm64
./prometheus 

