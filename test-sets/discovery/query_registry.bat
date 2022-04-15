@ECHO OFF

ECHO ===========================================================================
ECHO QUERY REGISTRY
ECHO Query registry commandline
ping -n 3 127.0.0.1 > NUL


REG QUERY HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\RecentDocs
REG QUERY HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\RunOnce
