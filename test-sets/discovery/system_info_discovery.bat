@ECHO OFF

ECHO ===========================================================================
ECHO SYSTEM DISCOVERY
ECHO Remote System Discovery commandline
ping -n 3 127.0.0.1 > NUL

gpresult -r
gpresult -z
reg query HKLM\\SYSTEM\\CurrentControlSet\\Services\\Disk\\Enum
systeminfo
