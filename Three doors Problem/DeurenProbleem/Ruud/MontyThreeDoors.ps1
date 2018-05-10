<#
---------------------------------------------------------------------------------
.SYNOPSIS         
The Monty Hall problem is a brain teaser, in the form of a puzzle

.DESCRIPTION     
Suppose you're on a game show, and you're given the choice of three doors:
Behind one door is a car; behind the others, goats. You pick a door, say No. 1,
and the host, who knows what's behind the doors, opens another door, say No. 3,
which has a goat.
He then says to you, "Do you want to pick door No. 2?"
Is it to your advantage to switch your choice?

.PARAMETER numberOfRounds Int        123        The number of rounds to play
.PARAMETER KeepDoor       Switch                Player do not switch door

.EXAMPLE
PlayGame            = One round

.EXAMPLE
PlayGame 123        = 123 Rounds

.EXAMPLE
PlayGame 123 -keepDoor  = 123 Rounds and the player does not switch from door

.COMPONENT
 Non

.NOTES
FILENAME    MontyThreeDoors.ps1
VERSION     1.0.1
AUTHOR      R.R. Ravensbergen

        USE NATIVE or SDX POWERSHELL CMD/LETS.  MINIMIZE WMI CALLS USE

HISTORY
---------------------------------------------------------------------------------
DD-MM-YYYY - Version - Name - Company : Changes
---------------------------------------------------------------------------------
24-04-2018 - 1.0.0   - R.R.Ravensbergen - Private : First version
05-05-2018 - 1.0.1   - R.R.Ravensbergen - Private : Minimalist it
---------------------------------------------------------------------------------
#>

#--------------------------------------------------------------------------------- 
# Set script preferences 
#--------------------------------------------------------------------------------- 
Set-StrictMode -Version Latest 
$ErrorActionPreference = "Stop" 

#---------------------------------------------------------------------------------
# Main Function 
#---------------------------------------------------------------------------------
function PlayGame
{
Param(
  [Int]$numberOfRounds = 1,
  [Switch]$keepDoor
  )

# Define variables
$priceDoor = 0
$chosenDoor = 0

$winCount = 0
$lostCount = 0
$numberOfRoundsCount = 0

$winpercent = 0
$lostPercent = 0

# Play the game for X times
While ($numberOfRoundsCount -lt $numberOfRounds)
{
    # The quizmaster presents the participant with three doors, with a prize behind only one door
    # Place a prize behind a door
    $priceDoor = SetDoor

    # The participant chooses a door.
    $chosenDoor = SetDoor

    # If the player always switches the door then............Buit if the play do NOT switch
    if ($keepDoor -eq $true)
        {
            if ($chosenDoor -ne $priceDoor)
            {
                $lostCount++
            }
            else
            {
                $winCount++ 
            }
        }   
    else
        {
            if ($chosenDoor -ne $priceDoor)
            {
                $winCount++    
            }
            else
            {
                $lostCount++    
            }
        }

    # One round played so count it
    $numberOfRoundsCount++
}

# Just do some math    
$winpercent = ("{0:P1}" -f ($winCount / $numberOfRounds))
$lostPercent = ("{0:P1}" -f ($lostCount / $numberOfRounds))

Write-Host "After $numberOfRoundsCount round(s) the player :"
Write-Host "Wins : $winPercent and Lose : $lostPercent"
Write-Host "Did the player chose another : "
    if ($keepDoor -eq $true) {Write-Host "Yes" } else {Write-Host "No"}
Write-Host ""
}

#---------------------------------------------------------------------------------
# Script Functions 
#---------------------------------------------------------------------------------
function SetDoor
{
<#
.SYNOPSIS         
Give back a number representing a door
#>
    $Door = Get-Random -Minimum 1 -Maximum 4
    return $Door
}

#--------------------------------------------------------------------------------- 
# Main
#--------------------------------------------------------------------------------- 
try 
{ 
    $stopwatch = [system.diagnostics.stopwatch]::StartNew();
    Clear-Host
    PlayGame 123 #-keepDoor
    $stopwatch.Stop();
    Write-Host ("Lead time in seconds: {0:F2}" -f $stopwatch.Elapsed.TotalSeconds);
} 
catch 
{ 
     throw
} 
finally  
{
     Pop-Location;
} 
