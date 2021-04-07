<#
#>
function Disable-UAC {
    New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force
    Write-Host "UAC is disabled. Restart required." -ForegroundColor Yellow
}

function Show-HiddenFolder {
    Push-Location
    Set-Location "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Set-ItemProperty . Hidden "1"
    Pop-Location

    Write-Host "Hidden folders are shown."
}

function Show-FileExtension {
    Push-Location
    Set-Location "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    Set-ItemProperty . HideFileExt "0"
    Pop-Location

    Write-Host "File extensions are shown."
}

Export-ModuleMember -Function Disable-UAC
Export-ModuleMember -Function Show-HiddenFolder
Export-ModuleMember -Function Show-FileExtension