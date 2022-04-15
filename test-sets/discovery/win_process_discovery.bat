@ECHO OFF

ECHO ===========================================================================
ECHO WIN PROCESS DISCOVERY
ECHO Process Discovery
ping -n 3 127.0.0.1 > NUL

wmic process list /format:list
tasklist /v
