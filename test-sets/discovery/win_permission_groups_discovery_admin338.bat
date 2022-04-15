@ECHO OFF

ECHO ===========================================================================
ECHO OERMISSION GROUP DISCOVERY
ECHO Permission Groups Discovery commands run by admin@338 APT GROUP
ping -n 3 127.0.0.1 > NUL

net localgroup administrators >> C:\\Users\\AUTOMA~1\\AppData\\Local\\Temp\\download
