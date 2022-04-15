@ECHO OFF

ECHO ===========================================================================
ECHO ACCOUNT DISCOVERY
ECHO Account Discovery commands run by admin@338 APT GROUP
ping -n 3 127.0.0.1 > NUL

net user >> C:\\Users\\AUTOMA~1\\AppData\\Local\\Temp\\download
net user /domain >> C:\\Users\\AUTOMA~1\\AppData\\Local\\Temp\\download
