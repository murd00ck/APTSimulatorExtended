@ECHO OFF

ECHO ===========================================================================
ECHO RDP to SERVER
ECHO Attempt an RDP session via Remote Desktop Application over Powershell
ping -n 5 127.0.0.1 > NUL

powershell.exe "iex $Server="#{logonserver}";
$User="#{username}";
$Password="#{password}";
cmdkey /generic:TERMSRV/$Server /user:$User /pass:$Password;
mstsc /v:$Server;
echo "RDP connection established""
