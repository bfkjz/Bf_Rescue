ping=`ping -c 3 www.baidu.com | grep "3 received" | wc -l`
if [ $ping -eq 1  ];then
echo network_ok
echo 
else
echo 
echo network_no
echo 
nmcli connection up debianap
fi