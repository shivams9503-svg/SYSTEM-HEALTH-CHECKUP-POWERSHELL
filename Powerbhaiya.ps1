Write-Host "Hey guys, how are you doing? This is Powerbhaiya script running!"
Write-Host "Starting 5 CPU-intensive tasks in the background..."

Write-Host "Top 10 processes running on your system:"
Get-Process |
    Sort-Object -Property CPU -Descending |
    Select-Object -First 10 Name, CPU, ID

$drive = Get-PSDrive -Name C -ErrorAction SilentlyContinue
if ($drive) {
    $drive |
        Select-Object Name,
            @{Name = "Used(GB)"; Expression = { [math]::Round($_.Used / 1GB, 2) }},
            @{Name = "Free(GB)"; Expression = { [math]::Round($_.Free / 1GB, 2) }}
}

if (Get-Command Get-MpComputerStatus -ErrorAction SilentlyContinue) {
    Get-MpComputerStatus |
        Select-Object AntivirusEnabled, AntivirusSignatureAge
} else {
    Write-Host "Windows Defender status is not available in this environment."
}