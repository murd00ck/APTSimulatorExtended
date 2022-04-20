@ECHO OFF

ECHO ===========================================================================
ECHO Windows Exfiltration
ECHO Bitsadmin download a file
ping -n 5 127.0.0.1 > NUL

bitsadmin /transfer systemrepair /download /priority normal http://127.0.0.1/file.txt c:\windows\temp\file.txt
