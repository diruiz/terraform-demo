<powershell>
Install-WindowsFeature -name Web-Server -IncludeManagementTools

Write-Host "Installing Git for windows..." -ForegroundColor Cyan
$exePath = "C:\temp\git.exe"
Write-Host "Downloading..."
(New-Object Net.WebClient).DownloadFile('https://github.com/git-for-windows/git/releases/download/v2.37.1.windows.1/Git-2.37.1-64-bit.exe', $exePath)
Write-Host "Installing..."
Start-Process $exePath -Wait -ArgumentList '/NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh" /LOG="C:\git-for-windows.log"'


New-Item -Path C:\inetpub\wwwroot\index.html -ItemType File -Force
Add-Content -Path C:\inetpub\wwwroot\index.html "<font face = "Verdana" size = "5">"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center><h1>AWS Windows VM Deployed with Terraform</h1></center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center> <b>EC2 Instance Metadata</b> </center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center> <b>Instance ID:</b> $instanceId </center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center> <b>AWS Availablity Zone:</b> $instanceAZ </center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center> <b>Public Hostname:</b> $pubHostName </center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center> <b>Public IPv4:</b> $pubIPv4 </center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center> <b>Private Hostname:</b> $privHostName </center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "<center> <b>Private IPv4:</b> $privIPv4 </center>"
Add-Content -Path C:\inetpub\wwwroot\index.html "</font>"

</powershell>