@ECHO OFF

ECHO ===========================================================================
ECHO SYSTEM DISCOVERY
ECHO Remote System Discovery
ping -n 3 127.0.0.1 > NUL

net view
net view /domain
arp -a
