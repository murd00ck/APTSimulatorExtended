@ECHO OFF

ECHO ===========================================================================
ECHO TIMESTOMP
ECHO timestomp a file with powershell
ping -n 3 127.0.0.1 > NUL

echo \"Test File\" > test.txt
type test.txt
test.txt
powershell.exe -com {$file=(gi test.txt);$date='01/03/2006 12:12 pm';$file.LastWriteTime=$date;$file.LastAccessTime=$date;$file.CreationTime=$date}
dir test.txt
del test.txt
