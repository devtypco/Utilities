write-host "Installing Micro Focus COBOL Server software..."
# Start-Process -FilePath "cs_23.exe" -ArgumentList '/s','/v"','/qn"' -NoNewWindow -Wait -WorkingDirectory "C:\TEMP"
Start-Process -FilePath C:\TEMP\cs_23.EXE -argumentlist '/s','/v"','/qn"' -NoNewWindow -Wait