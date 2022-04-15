@ECHO OFF

ECHO ===========================================================================
ECHO SYSTEM OWNER USER
ECHO System Owner-User Discovery
ping -n 3 127.0.0.1 > NUL

whoami
wmic useraccount get /ALL
quser /SERVER:localhost
qwinsta.exe /server:localhost
set
tasklist /v
Net user administrator
