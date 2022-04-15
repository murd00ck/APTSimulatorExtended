@ECHO OFF

ECHO ===========================================================================
ECHO DISCOVERY WIN ACCOUNT
ECHO Account discovery commands via net, dsquery, wmic (note dsquery specific to dsquery location on vagrant)
ping -n 3 127.0.0.1 > NUL

net group \"Domain Admins\" /domain
net user
net user /domain
net localgroup administrators
net share
net use
net accounts
net config workstation
C:\\tools\win32bins\\activedirectory\\dsquery server
C:\\tools\win32bins\\activedirectory\\dsquery user -name smith* | C:\\tools\win32bins\\activedirectory\\dsget user -dn -desc
wmic useraccount list /format:list
wmic ntdomain
wmic group list /format:list
wmic sysaccount list /format:list
