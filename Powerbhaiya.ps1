Write-Host "Hey guys, how are you doing? This is Powerbhaiya script running!"
Write-Host "We do 5 CPU-intensive tasks in the background and then we will get the top 10 processes running on your system."

Get-Process |
    Sort-Object CPU -Descending |
    Select-Object -First 10 Name, CPU, ID

Get-PSDrive C |
    Select-Object Name,
        @{Name = "Used(GB)"; Expression = { [math]::Round($_.Used / 1GB, 2) }},
        @{Name = "Free(GB)"; Expression = { [math]::Round($_.Free / 1GB, 2) }}

Get-MpComputerStatus |
    Select-Object AntivirusEnabled, AntivirusSignatureAge