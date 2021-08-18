<#
    .SYNOPSIS
    Removes Location from Snipe-it asset system
    .DESCRIPTION
    Removes localtion or multiple locations from Snipe-it asset system
    .PARAMETER ID
    Unique ID For location to be removed
    .PARAMETER url
    Deprecated parameter, please use Connect-SnipeitPS instead. URL of Snipeit system.

    .PARAMETER apiKey
    Deprecated parameter, please use Connect-SnipeitPS instead. User's API Key for Snipeit.

    .EXAMPLE
    Remove-SnipeitLocation -ID 44

    .EXAMPLE
    Get-SnipeitLocation -city Arkham  | Remove-SnipeitLocation
#>

function Remove-SnipeitLocation () {
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "Low"
    )]

    Param(
        [parameter(mandatory = $true,ValueFromPipelineByPropertyName)]
        [int[]]$id,

        [parameter(mandatory = $false)]
        [string]$url,

        [parameter(mandatory = $false)]
        [string]$apiKey
    )

    begin {
    }

    process {
        foreach($location_id in $id) {
            $Parameters = @{
                Api    = "/api/v1/locations/$asset_id"
                Method = 'Delete'
            }

            if ($PSBoundParameters.ContainsKey('apiKey')) {
                Write-Warning "-apiKey parameter is deprecated, please use Connect-SnipeitPS instead."
                Set-SnipeitPSSessionApiKey -apiKey $apikey
            }

            if ($PSBoundParameters.ContainsKey('url')) {
                Write-Warning "-url parameter is deprecated, please use Connect-SnipeitPS instead."
                Set-SnipeitPSSessionUrl -url $url
            }

            if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
                $result = Invoke-SnipeitMethod @Parameters
            }

            $result
        }
    }
}
