@ECHO OFF

ECHO ===========================================================================
ECHO CREATE ACCOUNT POWERSHELL
ECHO Windows commandline new user creation with powershell.
powershell.exe New-LocalUser -FullName 'Jack Frost' -Name 'Jackfro' -Password 'Pwndiddy1' -Description 'Pwnage account'
net user jackfro /delete
