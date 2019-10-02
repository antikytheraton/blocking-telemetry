## Block every IP address in blocklist.txt
## DROP incomming packets to avoid information leak about your hosts firewall
## (HT to Conor Mancone) REJECT outgoing packets to avoid browser wait
for i in $(cat blocking.txt); do
    echo "Blocking all traffic to and from $i"
    /sbin/iptables -I INPUT -s $i -j DROP
    /sbin/iptables -I OUTPUT -d $i -j REJECT
done