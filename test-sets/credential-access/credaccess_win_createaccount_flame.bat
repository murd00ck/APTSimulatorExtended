@ECHO OFF

ECHO ===========================================================================
ECHO CREATE ACCOUNT HELP ASSISTANT
ECHO Flame can create backdoor accounts with the login "HelpAssistant" with the Limbo module.
ping -n 5 127.0.0.1 > NUL

net user /add HelpAssistant Pwndiddy1
net user HelpAssistant /delete
