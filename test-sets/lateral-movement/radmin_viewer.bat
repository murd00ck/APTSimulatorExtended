@ECHO OFF

ECHO ===========================================================================
ECHO T1072 - Software Deployment Tools
ECHO An adversary may use Radmin Viewer Utility to remotely control Windows device, this will start the radmin console.
ping -n 5 127.0.0.1 > NUL


echo Downloading radmin installer
bitsadmin /transfer myDownloadJob /download /priority normal "https://www.radmin.com/download/Radmin_Viewer_3.5.2.1_EN.msi" #{radmin_installer}
msiexec /i "#{radmin_installer}" /qn
