# Find and uninstall all versions of Microsoft Visual C++.
$VisualC = Get-ChildItem -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall' |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -like "Microsoft Visual C*" } |
            Select-Object -Property DisplayName, UninstallString
$VisualC
ForEach ($ver in $VisualC) {
    If ($ver.UninstallString) {
        $uninst = $ver.UninstallString
        & cmd /c $uninst /quiet /norestart
    }
}