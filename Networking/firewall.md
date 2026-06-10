# Firewalls

## What is Firewall?
- Controls incoming/outgoing traffic

## Example (iptables)
Allow port 80:
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

Block all:
iptables -A INPUT -j DROP
