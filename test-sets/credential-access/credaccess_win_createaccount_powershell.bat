@ECHO OFF

ECHO ===========================================================================
ECHO CREATE ACCOUNT POWERSHELL
ECHO Windows commandline new user creation with powershell.
ping -n 5 127.0.0.1 > NUL

powershell.exe -command "$Password=Pwndiddy1"
powershell.exe New-LocalUser -FullName 'Dante' -Name 'dantea' -noPassword -Description 'APT'
net user dantea /delete
