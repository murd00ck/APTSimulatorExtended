@ECHO OFF

ECHO ===========================================================================
ECHO REMOVE INDICATOR WEVTUTIL
ECHO Indicator Removal on Host with wevtutil
ping -n 3 127.0.0.1 > NUL

wevtutil cl System
