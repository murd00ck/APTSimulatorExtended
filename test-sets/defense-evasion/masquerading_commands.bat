@ECHO OFF

ECHO ===========================================================================
ECHO MASQUERADING COMMANDS
ECHO Masquerading commands run by admin@338 APT GROUP
ping -n 3 127.0.0.1 > NUL

echo \"BUBBLEWRAP (also known as Backdoor.APT.FakeWinHTTPHelper)\"  > C:\\Users\\test.sandbox\\AppData\\Local\\Temp\\upload
ren C:\\Users\\test.sandbox\\AppData\\Local\\Temp\\upload audiodg.exe
