<#
.SYNOPSIS
Dit script voert het driedeuren probleem uit, zo vaak als door de gebruiker opgegeven en toont de scorekans in procenten.

.PARAMETER Rondes
Aantal rondes dat het driedeurenprobleem moet worden uitgevoerd.

#>

param(
    [int]$Rondes = 10,
    [switch]$HerzieKeuzeNiet
)

$wins = 0;
$loop = $Rondes;
$stopwatch = [system.diagnostics.stopwatch]::StartNew();
while ($loop-- -gt 0)
{
    $gift = (Get-Random -Minimum 1 -Maximum 4);
    $choice = (Get-Random -Minimum 1 -Maximum 4);
    $quiz = Get-Random -InputObject ((1..3) | where { $_ -ne $gift -and $_ -ne $choice})
    if (-not $HerzieKeuzeNiet.IsPresent)
    {
        $choice = Get-Random -InputObject ((1..3) | where { $_ -ne $choice -and $_ -ne $quiz})
    }

    if ($choice -eq $gift)
    {
        $wins++;
    }
}
$stopwatch.Stop();

echo "Rondes          : $Rondes";
echo "Gewonnen        : $wins"
echo ("Verloren        : {0}" -f ($Rondes-$wins));
echo ("Winst percentage: {0:P1}" -f ($wins / $Rondes));
echo ("Duur in seconden: {0:F2}" -f $stopwatch.Elapsed.TotalSeconds);
