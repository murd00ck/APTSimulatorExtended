@ECHO OFF

ECHO ===========================================================================
ECHO T1021.002 - SMB/Windows Admin Shares
ECHO Connecting To Remote Shares
ping -n 5 127.0.0.1 > NUL


net use \\#{computer_name}\#{share_name} #{password} /u:#{user_name}
