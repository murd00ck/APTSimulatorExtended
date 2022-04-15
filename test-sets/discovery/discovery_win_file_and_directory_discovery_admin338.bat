@ECHO OFF

ECHO ===========================================================================
ECHO FILE AND DIRECTORY DISCOVERY
ECHO File and Directory Discovery commands run by admin@338 APT GROUP
ping -n 3 127.0.0.1 > NUL

dir c:\\ >> C:\\Users\\AUTOMA~1\AppData\\Local\\Temp\\download
dir \"c:\\Documents and Settings\" >> C:\\Users\\AUTOMA~1\\AppData\\Local\\Temp\\download
dir \"c:\\Program Files\\\" >> C:\\Users\\AUTOMA~1\\AppData\\Local\\Temp\\download
dir d:\\ >> C:\\Users\\AUTOMA~1\AppData\\Local\\Temp\\download
type C:\\Users\\AUTOMA~1\\AppData\\Local\\Temp\\download
