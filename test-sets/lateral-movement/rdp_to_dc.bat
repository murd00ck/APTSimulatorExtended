@ECHO OFF

ECHO ===========================================================================
ECHO RDP to AD
ECHO Attempt an RDP session via Remote Desktop Application to a Domain Controller.
ping -n 5 127.0.0.1 > NUL

powershell.exe
$Server=#{logonserver};
$User = Join-Path #{domain} #{username};
$Password="#{password}";
cmdkey /generic:TERMSRV/$Server /user:$User /pass:$Password;
mstsc /v:$Server;
echo "RDP connection established
