$calcs=0
do
{
    try
    {
        cls
        ""
        $Inp=Read-Host -Prompt "Geef het aantal berekeningen voor het deurspel"
        $calcs=[int]$Inp
    }
    catch
    {
       ""
       "Foute input sukkel !"
       "Nog maar een keer proberen"
       ""
       sleep -s 4
    }

}while($calcs -eq 0)

$Pricecnt1=0
$Pricecnt2=0
$Select=@(0,0)
cls
" BUSY "
for ($Y=0;$y -lt $calcs;$Y++)
{
    # "Calculation: $Y off $calcs"
    # step 1 - Select door for price
    $PriceDoor=get-random -minimum 1 -maximum 4      
    $Select[0]=$PriceDoor
    # step 2 - Select door for Player 
    $PlayerDoor=get-random -minimum 1 -maximum 4
    $Select[1]=$PlayerDoor
    $Select=$Select | sort
    # Step 3 - Select Goatdoor
    $Goatdoor=0
    Do
    {
        $Goatdoor=$Goatdoor+1
    }
    While($Select -eq $Goatdoor)
    $Player1Choice=get-random -minimum 0 -maximum 2
    $Playerdoor1=$Select[$Player1Choice]
      
    if ($Playerdoor -eq $PriceDoor)
    {
        $Pricecnt1=$Pricecnt1+1
    }
    if ($Playerdoor1 -eq $PriceDoor)
    {
        $Pricecnt2=$Pricecnt2+1
    }
}

cls
If ($Calcs -eq 1)
{
    ""
    $player1TV1=""
    $player1TV2=""
    If ($Playerdoor -eq $PriceDoor)
    {
       $player1TV1=" OOK"
       "De Speler die niet veranderde heeft GEWONNEN - Score JaWohl 100,0 Procent."
    }
    else
    {
       $player1TV2=" OOK"
       "De Speler die niet veranderde heeft verloren - Score Schade 0,0 Procent."
    }     
    If ($Playerdoor1 -eq $PriceDoor)
    {
   
       "De Speler die veranderde heeft$player1TV1 GEWONNEN - Score 100,0 Procent."
    }
    else
    {
       "De Speler die veranderde heeft$player1TV2 verloren - Score Schade 0,0 Procent."
    } 
    ""
}
else
{
    if ($Pricecnt1 -eq 0)
    {
        $Proc1txt="0,0"
    }
    else
    {
        $Proc1txt=($Pricecnt1/($calcs/100)).tostring("##.#")
        If ($Proc1txt -notmatch  ","){$Proc1txt=$Proc1txt+",0"}
    }

    if ($Pricecnt2 -eq 0)
    {
        $Proc2txt="0,0"
    }
    else
    {
        $Proc2txt=($Pricecnt2/($calcs/100)).tostring("##.#")
        If ($Proc2txt -notmatch  ","){$Proc2txt=$Proc2txt+",0"}
    }
    ""
    "Score van de speler die niet veranderde heeft: $Pricecnt1 van $calcs keer gewonnen en dat is $Proc1txt %"
    "Score van de speler die veranderde heeft: $Pricecnt2 van $calcs keer gewonnen en dat is $Proc2txt %"
    if ($Pricecnt1 -lt $Pricecnt2){"Dus.... doet u maar vooral wisselen!!!!"}
    ""
}


