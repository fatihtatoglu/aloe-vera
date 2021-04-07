<#
#>
function Update-PowerShell {
    $currentVersion = $PSVersionTable.PSVersion.Major
    if ($currentVersion -ge 5) {
        Write-Host "PowerShell is updated."
        return
    }
    
    $url = "https://raw.githubusercontent.com/jborean93/ansible-windows/master/scripts/Upgrade-PowerShell.ps1"
    $file = "$env:temp\Upgrade-PowerShell.ps1"
    
    (New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
    Write-Host "Update script is downloaded."

    $currentPolicy = Get-ExecutionPolicy -List | Where-Object Scope -eq "LocalMachine" | Select-Object ExecutionPolicy
    if ($currentPolicy -ne "Unrestricted") {
        Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
    }

    &$file -Version 5.1 -Verbose

    Set-ExecutionPolicy -ExecutionPolicy $currentPolicy

    Write-Host "PowerShell is updated."
}

Export-ModuleMember -Function Update-PowerShell