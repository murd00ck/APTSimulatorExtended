@ECHO OFF

ECHO ===========================================================================
ECHO DISABLE FIREWALL
ECHO Disable windows firewall win7+
ping -n 5 127.0.0.1 > NUL

netsh advfirewall set currentprofile state off
netsh advfirewall set domainprofile state off
netsh advfirewall set privateprofile state off
netsh advfirewall set publicprofile state off
netsh advfirewall set  allprofiles state off
