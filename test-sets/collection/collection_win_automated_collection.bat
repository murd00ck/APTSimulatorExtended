ECHO ===========================================================================
ECHO Mass automated collection of a file type
dir 'c:' /b /s .docx | findstr /e .docx
powershell Get-ChildItem -Recurse -Include *.doc | % {Copy-Item $_.FullName -destination c:\temp}
