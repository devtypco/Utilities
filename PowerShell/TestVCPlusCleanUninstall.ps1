$apps = Get-WmiObject -Query "SELECT * FROM Win32_Product WHERE Name like '%Microsoft Visual C%'"
foreach ($app in $apps) 
    {
    "Name = " + $app.name
    $app.Uninstall()
    }