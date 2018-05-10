<#
.SYNOPSIS
Dit script voert het driedeuren probleem uit, zo vaak als door de gebruiker opgegeven en toont de scorekans in procenten.

.PARAMETER Rondes
Aantal rondes dat het driedeurenprobleem moet worden uitgevoerd.

#>

param(
    [int]$Rondes = 10,
    [switch]$HerzieKeuzeNiet,
    [switch]$VerbergVoortgang
)

Import-Module $PSScriptRoot\DrieDeurenProbleem.psm1 -Force;

$result = Invoke-DrieDeurenProbleem -Rounds $Rondes -StickToFirst:$HerzieKeuzeNiet -HideProgress:$VerbergVoortgang;

echo "Rondes          : $($result.Rounds)";
echo "Gewonnen        : $($result.wins)"
echo "Verloren        : $($result.losses)";
echo ("Winst percentage: {0:P1}" -f $result.winRatio);
echo ("Duur in seconden: {0:F2}" -f $result.duration.TotalSeconds);
