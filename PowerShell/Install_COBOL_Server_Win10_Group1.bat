::  Install Micro Focus COBOL Server on local computer(user) in Group 1.
::  Assign new network path for drive E: to \\app1\ntdisk
NET USE E: /DELETE
NET USE E: \\APP1\NTDISK /PERSISTENT:YES
c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Unrestricted -File E:\POWERSHELL\Win10InstallCOBOLServerGroup1.ps1
pause
c:\windows\system32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Restricted
pause
