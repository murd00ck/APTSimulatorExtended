@ECHO OFF

ECHO ===========================================================================
ECHO ACCOUNT WMIC
ECHO Account discovery via WMIC
ping -n 3 127.0.0.1 > NUL

wmic useraccount get /ALL
wmic process get caption,executablepath,commandline
wmic qfe get description,installedOn /format:csv
powershell.exe get-wmiobject -class \"win32_share\" -namespace \"root\CIMV2\" -computer \"targetname\"
