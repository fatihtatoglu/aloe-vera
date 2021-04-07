<#
#>
function Initialize-WinRM {
    $url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
    $file = "$env:temp\ConfigureRemotingForAnsible.ps1"

    (New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
    &$file -Verbose

    Write-Host "WinRM is configured."
}

Export-ModuleMember -Function Initialize-WinRM