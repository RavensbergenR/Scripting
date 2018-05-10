$Counter = 1
$MaxAttempts = 1000
$ChangeDoor = $true
$Win = 0
$Lose = 0

while ($Counter -le $MaxAttempts) {    
    $PlayerDoor = Get-Random -Minimum 1 -Maximum 4
    $PrizeDoor = Get-Random -Minimum 1 -Maximum 4
    $OtherDoor = (1..3 | Where-Object { $_ -notin $PlayerDoor, $PrizeDoor} | Select-Object -First 1)
    
    if (!$ChangeDoor) {
        $PlayerRevize = $PlayerDoor
    }
    else {
        $PlayerRevize = (1..3 | Where-Object { $_ -notin $PlayerDoor,$OtherDoor } | Select-Object -First 1)
    }
    #echo "PlayerDoor: $PlayerDoor, PrizeDoor: $PrizeDoor, OtherDoor: $OtherDoor, PlayerRevize: $PlayerRevize"
    if ($PrizeDoor -eq $PlayerRevize) {
        $Win++
    } else {
        $Lose++       
    }
    $Counter++
}
$WinPercentage = ("{0:P0}" -f ($Win / $MaxAttempts))
$LosePercentage = ("{0:P0}" -f ($Lose / $MaxAttempts))
write-host "Wins = $Win"
Write-Host "Losses = $Lose"
Write-Host "Winst percentage : $WinPercentage"
Write-Host "Verlies percentage $LosePercentage"
