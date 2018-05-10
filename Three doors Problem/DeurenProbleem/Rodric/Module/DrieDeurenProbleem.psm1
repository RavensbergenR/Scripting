function Invoke-DrieDeurenProbleem
{
    param(
        [Parameter(Mandatory=$true)]
        [int]$Rounds,
        [switch]$StickToFirst,
        [switch]$HideProgress
    )

    $ACTIVITY = "Three Door Challenge";
    $wins = 0;
    $loop = 0;
    $stopwatch = [system.diagnostics.stopwatch]::StartNew();
    $progressInterval = $Rounds / 10;
    while ($loop++ -lt $Rounds)
    {
        $gift = (Get-Random -Minimum 1 -Maximum 4);
        $choice = (Get-Random -Minimum 1 -Maximum 4);
        $quiz = Get-Random -InputObject ((1..3) | where { $_ -ne $gift -and $_ -ne $choice})
        if (-not $StickToFirst.IsPresent)
        {
            $choice = Get-Random -InputObject ((1..3) | where { $_ -ne $choice -and $_ -ne $quiz})
        }

        if ($choice -eq $gift)
        {
            $wins++;
        }
        if (!$HideProgress -and ($loop % $progressInterval) -eq 0)
        {
            Write-Progress -Activity $ACTIVITY -Status ("Wins: {0}, win ratio {1:P1}" -f $wins,($wins/$loop)) -PercentComplete ($loop/$Rounds*100);
        }
    }
    if (!$HideProgress)
    {
        Write-Progress -Activity $ACTIVITY -Completed;
    }

    return @{
        rounds = $Rounds;
        wins = $wins;
        losses = ($Rounds - $wins);
        winRatio = ($wins / $Rounds);
        duration = $stopwatch.Elapsed;
    }
}
