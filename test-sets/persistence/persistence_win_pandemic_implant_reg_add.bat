@ECHO OFF

ECHO ===========================================================================
ECHO Persistence
ECHO Persistence - Pandemic implant reg add
ping -n 5 127.0.0.1 > NUL

bitsadmin /transfer systemrepair /download /priority normal http://127.0.0.1/file.txt c:\windows\temp\file.txt
