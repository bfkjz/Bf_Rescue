BFrescue=`nmcli con show | grep bf_Bridge0 | wc -l`
if [ $BFrescue -eq 1 ];then
echo BFrescue core OK
else
nmcli con add type bridge ifname bf_br0  con-name bf_Bridge0 ipv4.addresses  192.168.68.1/24
nmcli con add type wifi ifname wlan0 con-name debianap autoconnect yes ssid debianap master bf_br0
nmcli con modify debianap 802-11-wireless.mode ap
nmcli con add type Ethernet ifname usb0 con-name usbEthernet  master bf_br0
nmcli connection down USB
echo BFrescue core OK
echo  
echo -e "The system automatically restarts after \033[47;31m 5 \033[0m seconds"
echo -e "Press \033[47;30m Ctrl + C \033[0m to cancel the restart"
echo  
echo -e "系统将会在 \033[47;31m 5 \033[0m 秒后自动重启"
echo -e "按 \033[47;30m Ctrl + C \033[0m 取消重启"
echo  
sleep 5
reboot
fi