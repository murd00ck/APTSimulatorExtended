@ECHO OFF

ECHO ===========================================================================
ECHO CREATE ACCOUNT HELP ASSISTANT
ECHO Flame can create backdoor accounts with the login "HelpAssistant" with the Limbo module.
net user /add HelpAssistant Pwndiddy1
net user HelpAssistant /delete
