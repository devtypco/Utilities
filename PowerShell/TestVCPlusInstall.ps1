# Write-Progress -Activity "Just a moment please" -Status "Installing Microsoft Visual C++ 2010 Redistributable..."
copy-item -Path "E:\Microsoft Visual C++ 2010 Redistributable\vcredist_x86.exe" -Destination "C:\TEMP"
# Start-Process -FilePath "vcredist_x86.exe" -ArgumentList '/q','/norestart' -NoNewWindow -Wait -WorkingDirectory "E:\Microsoft Visual C++ 2010 Redistributable"
Start-Process -FilePath C:\TEMP\VCREDIST_x86.EXE -argumentlist '/q','/norestart' -wait
write-host "Press any key to continue..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
