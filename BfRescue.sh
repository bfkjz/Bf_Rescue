BFrescue=`nmcli con show | grep bf_Bridge0 | wc -l`
if [ $BFrescue -eq 1 ];then
echo BFrescue core OK
else
nmcli con add type bridge ifname bf_br0  con-name bf_Bridge0 ipv4.addresses  192.168.68.1/24
nmcli con add type wifi ifname wlan0 con-name debianap autoconnect yes ssid debianap master bf_br0
nmcli con modify debianap 802-11-wireless.mode ap
nmcli con add type Ethernet ifname usb0 con-name usbEthernet  master bf_br0
nmcli connection dis USB
echo
echo BFrescue core OK
echo  

fi
