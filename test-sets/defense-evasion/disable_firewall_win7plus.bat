@ECHO OFF

ECHO ===========================================================================
ECHO DISABLE FIREWALL
ECHO Disable windows firewall win7+
netsh advfirewall set currentprofile state off
netsh advfirewall set domainprofile state off
netsh advfirewall set privateprofile state off
netsh advfirewall set publicprofile state off
netsh advfirewall set  allprofiles state off
