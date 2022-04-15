@ECHO OFF

ECHO ===========================================================================
ECHO POWERSHELL EXEC
ECHO Powershell execution examples.
ping -n 3 127.0.0.1 > NUL

powershell Get-NetIPConfiguration
powershell -window hidden Get-NetIPConfiguration
powershell -window hidden -encodedcommand RwBlAHQALQBOAGUAdABJAFAAQwBvAG4AZgBpAGcAdQByAGEAdABpAG8AbgA=
powershell Write-Host \"Doing Evil stuff here\"
powershell -window hidden -e VwByAGkAdABlAC0ASABvAHMAdAAgACIARABvAGkAbgBnACAARQB2AGkAbAAgAHMAdAB1AGYAZgAgAGgAZQByAGUAIgA=
powershell -window hidden -enc VwByAGkAdABlAC0ASABvAHMAdAAgACIARABvAGkAbgBnACAARQB2AGkAbAAgAHMAdAB1AGYAZgAgAGgAZQByAGUAIgA=
