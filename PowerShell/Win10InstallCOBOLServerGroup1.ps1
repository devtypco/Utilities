# Install Micro Focus COBOL Server on Windows 10 Computer.
# For 10 users on license file 2372723.mflic.
# COBOL Server Serial# 600000555096
enable-psremoting -force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
# Make 'TEMP' folder on local C:, if not exists.
if ( -not (test-path 'C:\TEMP' -PathType Container ))
    {MKDIR -Path 'C:\TEMP'}
    else {write-host "C:\temp\ already exists.."}
write-host
# For Windows XP, make 'New Minerals & Utilites' folder under 'All Users' 'Desktop'
Get-ExecutionPolicy 
Write-host "Creating New folder under Desktop....."
if ( -not (test-path "C:\Users\Public\Desktop\New Minerals & Utilities" -PathType Container ))
    { MKDIR -Path "C:\Users\Public\Desktop\New Minerals & Utilities" }
else { write-host "C:\Users\Public\Desktop\New Minerals & Utilities already exists.." }
write-host
# Copy Micro Focus COBOL Server license 2372723.mflic to desktop to be used in Micro Focus License Manager
Write-host "Copying COBOL Server License to Desktop....."
Get-ExecutionPolicy 
copy-item -path "\\App1\c$\Users\administrator.TYPDAL\Documents\Micro Focus COBOL - Product and Licenses\Serial# 600000555096\2372723.mflic" -Destination "C:\Users\Public\Desktop\"
write-host
# Create a restore point.
Write-host "Creating System Restore Point....."
Checkpoint-Computer -Description "Before COBOL Server Install"
write-host
# Find and Uninstall all Microfocus Visual C++ software
Write-host "Finding and uninstalling all Microsoft Visual C++ versions..."
Get-ExecutionPolicy 
invoke-expression E:\POWERSHELL\VisualCPlusUninstall.ps1
write-host
# Install Microsoft Visual C++ 2010 Redistributable software on local computer, silently.
write-host "Installing Microsoft Visual C++ 2010 Redistributable..."
set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
copy-item -Path "E:\Microsoft Visual C++ 2010 Redistributable\vcredist_x86.exe" -Destination "C:\TEMP"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
Start-Process -FilePath c:\temp\vcredist_x86.exe -ArgumentList '/q','/norestart' -wait
write-host
# Copy the COBOL Server 2.3 executable to local computer
write-host "Copying Micro Focus COBOL Server software to C:\TEMP..."
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
copy-item -Path "\\app1\c$\Users\administrator.TYPDAL\Desktop\Visual COBOL\cs_23.exe" -Destination "C:\TEMP"
write-host
# Install Micro Focus COBOL Server software on local computer, silently.
write-host "Installing Micro Focus COBOL Server software..."
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
Start-Process -FilePath C:\TEMP\cs_23.EXE -Argumentlist '/s','/v"','/qn"' -NoNewWindow -Wait
# Apply Micro Focus License for COBOL Server
Start-process -filepath "CesAdminTool.exe" -WorkingDirectory "C:\Program Files (x86)\Common Files\SafeNet Sentinel\Sentinel RMS License Manager\WinNT" -Wait
# For installaltion on Windows XP, copy icons to new folder(created above) on desktop .
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
copy-item -Path "E:\VisualCOBOL\Desktop\*.lnk" -Destination "C:\Users\Public\Desktop\New Minerals & Utilities\"
$oldPath=(Get-ItemProperty -Path ‘Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment’ -Name PATH).Path
$newPath=$oldPath+’;C:\Program Files (x86)\Micro Focus\COBOL Server\bin’
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -force
Set-ItemProperty -Path ‘Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment’ -Name PATH –Value $newPath
# Edit registry HKEY_CURRENT_USER\Console\ForceV2 and change DWORD value to 0.  This will allow the function key F11 to work properly in mineral program.
Set-ItemProperty -path HKCU:\Console -Name ForceV2 -Value 0 -Type DWord
Get-ItemProperty -Path HKCU:\Console -Name ForceV2