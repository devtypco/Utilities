# Install Micro Focus COBOL Server on XP Computer.
# For 10 users on license file 2372722.mflic.
enable-psremoting -force
# Make 'TEMP' folder on local C:, if not exists.
if ( -not (test-path 'c:\temp' -PathType Container ))
    {
        MKDIR -Path 'C:\TEMP'
    }
    else
    {
        write-host "C:\temp\ already exists.."
    }
# Write-host "Creating C:\TEMP..."
# mkdir -path 'C:\TEMP'
# write-host "Press any key to continue..."
# $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
# cls
# For Windows XP, make 'New Minerals & Utilites' folder under 'All Users' 'Desktop'
if ( -not (test-path 'c:\Documents and Settings\All Users\Desktop\New Minerals & Utilities' -PathType Container ))
    {
        MKDIR -Path 'C:\Documents and Settings\All Users\Desktop\New Minerals & Utilities'
    }
    else
    {
        write-host "C:\Documents and Settings\All Users\Desktop\New Minerals & Utilities already exists.."
    }
Write-host "Creating New folder under Desktop....."
mkdir -path "C:\Documents and Settings\All Users\Desktop\New Minerals & Utilities"
# write-host "Press any key to continue..."
# $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
# cls
# Copy Micro Focus COBOL Server license 2372721.mflic to desktop to be used in Micro Focus License Manager
Write-host "Copying COBOL Server License to Desktop....."
copy-item -path "\\App1\c$\Users\administrator.TYPDAL\Documents\Micro Focus COBOL - Product and Licenses\Serial# 600000555094\2372721.mflic" -Destination "C:\Documents and Settings\All Users\Desktop\"
# write-host "Press any key to continue..."
# $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
# cls
# Create a restore point.
# Write-Progress -Activity "Just a moment please" -Status "Creating a restore point..."
Write-host "Creating System Restore Point....."
# Checkpoint-Computer -Description "Before COBOL Server Install"
# write-host "Press any key to continue..."
# $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
# cls
# Find and Uninstall all Microfocus Visual C++ software
# Write-Progress -Activity "Just a moment please" -Status "Finding and uninstalling all Microsoft Visual C++ versions..."
Write-host "Finding and uninstalling all Microsoft Visual C++ versions..."
$apps = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name like '%Microsoft Visual C%'"
foreach ($app in $apps) 
    {
    "Name = " + $app.name
    $app.Uninstall()
    }
# write-host "Press any key to continue..."
# $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
# cls
# Install Microsoft Visual C++ 2010 Redistributable software on local computer, silently.
# Write-Progress -Activity "Just a moment please" -Status "Installing Microsoft Visual C++ 2010 Redistributable..."
write-host "Installing Microsoft Visual C++ 2010 Redistributable..."
copy-item -Path "E:\Microsoft Visual C++ 2010 Redistributable\vcredist_x86.exe" -Destination "C:\TEMP"
# Start-Process -FilePath "vcredist_x86.exe" -ArgumentList '/q','/norestart' -NoNewWindow -Wait -WorkingDirectory "E:\Microsoft Visual C++ 2010 Redistributable"
Start-Process -FilePath c:\temp\vcredist_x86.exe -ArgumentList '/q','/norestart' -wait
# write-host "Press any key to continue..."
# $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
# cls
# Copy the COBOL Server 2.3 executable to local computer
# Write-Progress -Activity "Just a moment please" -Status "Copying cs_23.exe to C:\TEMP..."
write-host "Copying Micro Focus COBOL Server software to C:\TEMP..."
copy-item -Path "\\app1\c$\Users\administrator.TYPDAL\Desktop\Visual COBOL\cs_23.exe" -Destination "C:\TEMP"
# write-host "Press any key to continue..."
# $x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
write-host
# cls
# Install Micro Focus COBOL Server software on local computer, silently.
# Write-Progress -Activity "Just a moment please" -Status "Installing Micro Focus COBOL Server..."
write-host "Installing Micro Focus COBOL Server software..."
# Start-Process -FilePath "cs_23.exe" -ArgumentList '/s','/v"','/qn"' -NoNewWindow -Wait -WorkingDirectory "C:\TEMP"
Start-Process -FilePath C:\TEMP\cs_23.EXE -Argumentlist '/s','/v"','/qn"' -NoNewWindow -Wait
# cls
# Apply Micro Focus License for COBOL Server
Start-process -filepath "CesAdminTool.exe" -WorkingDirectory "C:\Program Files\Common Files\SafeNet Sentinel\Sentinel RMS License Manager\WinNT" -Wait
# For installaltion on Windows XP, copy icons to new folder(created above) on desktop .
copy-item -Path "E:\VisualCOBOL\Desktop\*.lnk" -Destination "C:\Documents and Settings\All Users\Desktop\New Minerals & Utilities\"
