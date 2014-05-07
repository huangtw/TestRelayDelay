#!/bin/bash

OUTPUT_WITHOUT_RELAY="without_ssl_without_relay"
OUTPUT_WITH_RELAY="without_ssl_with_relay"
VPN_IP=$1

rm -rf ${OUTPUT_WITHOUT_RELAY} ${OUTPUT_WITH_RELAY}

for (( i=0; i<$2; i++ ))
do
	curl -o /dev/null "http://${VPN_IP}/cgi-bin/admin/getparam.cgi?system_info"  -w "%{time_connect} %{time_starttransfer} %{time_total}\\n" >> ${OUTPUT_WITHOUT_RELAY}
	curl -o /dev/null "http://localhost:3336/cgi-bin/admin/getparam.cgi?system_info&cameraIP=${VPN_IP}&servicePort=80"  -w "%{time_connect} %{time_starttransfer} %{time_total}\\n" >> ${OUTPUT_WITH_RELAY}
done

