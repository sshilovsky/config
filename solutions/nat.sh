OUTER=eth0
INNER=eth1

iptables -F

exit

iptables -t nat -F
iptables -I INPUT -i !$OUTER -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -i $OUTER -j REJECT --reject-with tcp-reset
iptables -A INPUT -p udp -i $OUTER -j REJECT --reject-with icmp-port

#iptables -I FORWARD -i $INNER -d 192.168.0.0/255.255.0.0 -j DROP
iptables -A FORWARD -i $INNER -s 192.168.0.0/255.255.0.0 -j ACCEPT

INNER=wlan0

#iptables -I FORWARD -i $INNER -d 192.168.0.0/255.255.0.0 -j DROP
iptables -A FORWARD -i $INNER -s 192.168.0.0/255.255.0.0 -j ACCEPT

iptables -A FORWARD -i $OUTER -d 192.168.0.0/255.255.0.0 -j ACCEPT
iptables -t nat -A POSTROUTING -o $OUTER -j MASQUERADE
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

echo 1 > /proc/sys/net/ipv4/ip_forward
