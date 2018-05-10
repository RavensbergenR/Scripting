# Turren

Function FaultyMessage
{
    cls
    $objForm2 = New-Object System.Windows.Forms.Form 
    $objForm2.Text = "[ Scheiße ]"
    $objForm2.Size = New-Object System.Drawing.Size(400,200) 
    $objForm2.StartPosition = "CenterScreen"
    $Font2 = New-Object System.Drawing.Font("Times New Roman",15,[System.Drawing.FontStyle]::Bold)
    $objForm2.Font = $Font2
    $objForm2.KeyPreview = $True
 
    $objLabel21 = New-Object System.Windows.Forms.Label
    $objLabel21.Location = New-Object System.Drawing.Size(10,20) 
    $objLabel21.Size = New-Object System.Drawing.Size(430,20) 
    $objLabel21.Text = "Du bist ein eingebildeter Fatzke."
    $objForm2.Controls.Add($objLabel21) 
 
    $objLabel22 = New-Object System.Windows.Forms.Label
    $objLabel22.Location = New-Object System.Drawing.Size(10,60) 
    $objLabel22.Size = New-Object System.Drawing.Size(430,20) 
    $objLabel22.Text = "FALSCHE EINGABE !!"
    $objForm2.Controls.Add($objLabel22) 
 
    $CancelButton21 = New-Object System.Windows.Forms.Button
    $CancelButton21.Location = New-Object System.Drawing.Size(30,100)
    $CancelButton21.Size = New-Object System.Drawing.Size(190,23)
    $CancelButton21.Text = "Noch Einmahl Ja......"
    $CancelButton21.Add_Click({$objForm2.Close()})
    $objForm2.Controls.Add($CancelButton21)
 
    $objForm2.Topmost = $True
    $objForm2.Add_Shown({$objForm2.Activate()})
    [void]$objForm2.ShowDialog()
}
 
Function CloseDoor
{
    $objForm1.Close()
    Return 1
}
 
Function CloseDoor1
{
    $objForm1.Close()
    Return 2
}
 
Function InputDoorPRG
{
    $Actions=@(0,0,0,0)
    Do
    {
        CLS
        [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
        [void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
        $objForm1 = New-Object System.Windows.Forms.Form 
        $objForm1.Text = "[ Ausfüllen! ]"
        $objForm1.Size = New-Object System.Drawing.Size(400,230) 
        $objForm1.StartPosition = "CenterScreen"
        $Font1 = New-Object System.Drawing.Font("Arial",8,[System.Drawing.FontStyle]::Bold)
        $objForm1.Font = $Font1
    
        $objForm1.KeyPreview = $True
 
        $OKButton11 = New-Object System.Windows.Forms.Button
        $OKButton11.Location = New-Object System.Drawing.Size(75,145)
        $OKButton11.Size = New-Object System.Drawing.Size(85,23)
        $OKButton11.Text = "Gut"
        $OKButton11.Add_Click({$Actions[0]=CloseDoor1})
        $objForm1.Controls.Add($OKButton11)
 
        $CancelButton12 = New-Object System.Windows.Forms.Button
        $CancelButton12.Location = New-Object System.Drawing.Size(180,145)
        $CancelButton12.Size = New-Object System.Drawing.Size(95,23)
        $CancelButton12.Text = "Abbrechen"
        $CancelButton12.Add_Click({$Actions[0]=CloseDoor})
        $objForm1.Controls.Add($CancelButton12)
 
        $objLabel11 = New-Object System.Windows.Forms.Label
        $objLabel11.Location = New-Object System.Drawing.Size(10,10) 
        $objLabel11.Size = New-Object System.Drawing.Size(430,20) 
        $objLabel11.Text = "Für Anfang das TürSpiel sollt Ihr der Fröbelahr ansch(l)ießen"
        $objForm1.Controls.Add($objLabel11) 
 
        $objLabel12 = New-Object System.Windows.Forms.Label
        $objLabel12.Location = New-Object System.Drawing.Size(10,45) 
        $objLabel12.Size = New-Object System.Drawing.Size(130,20) 
        $objLabel12.Text = "Wieviel Türen (>2):"
        $objForm1.Controls.Add($objLabel12) 
 
        $objLabel13 = New-Object System.Windows.Forms.Label
        $objLabel13.Location = New-Object System.Drawing.Size(10,75) 
        $objLabel13.AutoSize = $true 
        $objLabel13.Text = "Anzahl Türen zu öffnen (>0):"
        $objForm1.Controls.Add($objLabel13) 
 
        $objLabel14 = New-Object System.Windows.Forms.Label
        $objLabel14.Location = New-Object System.Drawing.Size(10,105) 
        $objLabel14.Size = New-Object System.Drawing.Size(160,20) 
        $objLabel14.Text = "Wieviel Versuchen (>0):"
        $objForm1.Controls.Add($objLabel14) 
    
        $objTextBox11 = New-Object System.Windows.Forms.TextBox 
        $objTextBox11.Location = New-Object System.Drawing.Size(210,40) 
        $objTextBox11.Size = New-Object System.Drawing.Size(40,20) 
        $objForm1.Controls.Add($objTextBox11)
 
        $objTextBox12 = New-Object System.Windows.Forms.TextBox 
        $objTextBox12 = New-Object System.Windows.Forms.TextBox 
        $objTextBox12.Location = New-Object System.Drawing.Size(210,70) 
        $objTextBox12.Size = New-Object System.Drawing.Size(40,20) 
        $objForm1.Controls.Add($objTextBox12)
 
        $objTextBox13 = New-Object System.Windows.Forms.TextBox 
        $objTextBox13 = New-Object System.Windows.Forms.TextBox 
        $objTextBox13.Location = New-Object System.Drawing.Size(210,100) 
        $objTextBox13.Size = New-Object System.Drawing.Size(40,20) 
        $objForm1.Controls.Add($objTextBox13)
 
        $objForm1.Topmost = $True
        $objForm1.Add_Shown({$objForm1.Activate()})
        [void]$objForm1.ShowDialog()

        if ($Actions[0] -eq 2)
        {
            Try
            {
                $Actions[1] = [int]$objTextBox11.Text
                If ($Actions[1] -lt 3)
                {
                    throw
                }
                $Actions[2] = [int]$objTextBox12.Text
                If ($Actions[2] -gt $Actions[1]-2)
                {
                    throw
                }
                $Actions[3] = [int]$objTextBox13.Text
                If ($Actions[3] -lt 1)
                {
                    throw
                }            
                $Actions[0]=2       
            }
            Catch
            {
                FaultyMessage
                $Actions[0]=0
            }
        }
    }While($Actions[0] -eq 0)
    Return $Actions
}

$DG=$true
Do
{
    # Screen Input
    $result=InputDoorPRG
    if ($result[0] -eq 1)
    {
        $DG=$false
    }
    else
    {
        # Intialization

        $resultcount1=0
        $resultcount2=0
        $Time1=get-date          
        $objForm3 = New-Object System.Windows.Forms.Form
        $objForm3.StartPosition = "CenterScreen"
        $objForm3.Text = "[ FortSchritt ]"
        $objForm3.Size = New-Object System.Drawing.Size(500,240)
    
        $objLabel31 = New-Object System.Windows.Forms.Label
        $objLabel31.Location = New-Object System.Drawing.Size(49,20) 
        $objLabel31.Size = New-Object System.Drawing.Size(200,15)

        $objLabel32 = New-Object System.Windows.Forms.Label
        $objLabel32.Location = New-Object System.Drawing.Size(40,35) 
        $objLabel32.Size = New-Object System.Drawing.Size(200,15)

        $objLabel33 = New-Object System.Windows.Forms.Label
        $objLabel33.Location = New-Object System.Drawing.Size(63,60) 
        $objLabel33.Size = New-Object System.Drawing.Size(200,15)

        $objLabel34 = New-Object System.Windows.Forms.Label
        $objLabel34.Location = New-Object System.Drawing.Size(20,85) 
        $objLabel34.Size = New-Object System.Drawing.Size(200,15)

        $objLabel35 = New-Object System.Windows.Forms.Label
        $objLabel35.Location = New-Object System.Drawing.Size(72,100) 
        $objLabel35.Size = New-Object System.Drawing.Size(200,15)

        $objLabel36 = New-Object System.Windows.Forms.Label
        $objLabel36.Location = New-Object System.Drawing.Size(34,120) 
        $objLabel36.Size = New-Object System.Drawing.Size(200,15)

        $objLabel37 = New-Object System.Windows.Forms.Label
        $objLabel37.Location = New-Object System.Drawing.Size(72,135) 
        $objLabel37.Size = New-Object System.Drawing.Size(200,15)

        $objLabel38 = New-Object System.Windows.Forms.Label
        $objLabel38.Location = New-Object System.Drawing.Size(20,160) 
        $objLabel38.Size = New-Object System.Drawing.Size(400,15)

        $objLabel31.Text = "Zeit Passiert:   "
        $objForm3.Controls.Add($objLabel31)
        $objLabel32.Text = "Zeit notwendig:   "            
        $objForm3.Controls.Add($objLabel32)
        $objLabel33.Text = "Versuche:   "
        $objForm3.Controls.Add($objLabel33)
        $objLabel34.Text = "Uneränderte Wahl:  "
        $objForm3.Controls.Add($objLabel34)
        $objLabel35.Text = "Prozent:    "
        $objForm3.Controls.Add($objLabel35)
        $objLabel36.Text = "Eränderte Wahl:   "
        $objForm3.Controls.Add($objLabel36)
        $objLabel37.Text = "Prozent:    "
        $objForm3.Controls.Add($objLabel37)
        $objLabel38.Text = ""
        $objForm3.Controls.Add($objLabel38)
        $objForm3.Show()| Out-Null
        $BS=(100/$result[3])
        # Screen Delay
        $Sleep=1
        if($result[3] -le 10)
        {
            $Delay=1
        }
        elseif($result[3] -le 20)
        {
            $Delay=2
        }
        elseif($result[3] -le 50)
        {
            $Delay=4
        }
        elseif ($result[3] -le 100)
        {
            $Delay=5
        }
        elseif($result[3] -le 500)
        {
            $Delay=20
        }
        elseif($result[3] -le 1000)
        {
            $Delay=40
        }
        elseif($result[3] -le 5000)
        {
            $Delay=50
        }
        elseif($result[3] -le 10000)
        {
            $Delay=100
        }
        elseif($result[3] -le 50000)
        {
            $Delay=500
        }
        elseif($result[3] -le 100000)
        {
            $Delay=5000
        }
        elseif($result[3] -le 1000000)
        {
            $Delay=10000
        }
        elseif($result[3] -ge 1000000)
        {
            $Delay=10000
        }
        $Delaycount=0
        # $result=@(0,3,1,10)
        # $result=@(0,10,8,10)
        # Start Calculation
        
        For ($I=0;$I -lt $result[3];$I++)
        {
 
            # step 1 - Select door for price
            $PriceDoor=get-random -minimum 1 -maximum $($result[1]+1)      
            # step 2 - Select door for Player 
            $PlayerDoor=get-random -minimum 1 -maximum $($result[1]+1)
            # Step 3 - Select Goatdoors
            $CheckDoors=@(1..$result[1])
            $SelectDoors=@(1..$result[1])
            $SMax=$result[1]
            $CheckDoors[$PriceDoor-1]=$result[1]+10+$PriceDoor
            $CheckDoors[$PlayerDoor-1]=$result[1]+100+$PlayerDoor
            
            $Max=$result[1]-1
            if ($PlayerDoor -eq $PriceDoor)
            {
              $max=$max+1
            }
            $CheckDoors=$CheckDoors | sort         
            For ($j=0;$J -lt $Result[2];$J++)
            {

              $GoatDoor=get-random -minimum 1 -maximum $Max
              $SelectDoors[$CheckDoors[$GoatDoor-1]-1]=$result[1]+100+$GoatDoor
              $CheckDoors[$GoatDoor-1]=$result[1]+1000+$GoatDoor
              $max=$max-1
              $SelectDoors=$SelectDoors | sort
              $CheckDoors=$CheckDoors | sort
            }

            # Step - 4 Select New Emptydoor for second choice
            $max=$result[1]-$result[2]+1
            $Player1Sel=get-random -minimum 1 -maximum $max
            
            $PlayerDoor1=$SelectDoors[$Player1Sel-1]
            
            # Step 5 - Calculating results
            # Unchanged selection
            if ($PlayerDoor -eq $PriceDoor)
            {
                $resultcount1=$resultcount1+1
            }
            # Changed selection
            if ($PlayerDoor1 -eq $PriceDoor)
            {
                $resultcount2=$resultcount2+1
            }
   
            if ($I -eq $DelayCount)
            {
                $Teller=$I+1
                $Delaycount=$Delaycount+$Delay
                $Time2=Get-Date
                $MinPast=($Time2-$Time1).TotalMinutes  
                $MinNeeded=(($MinPast/$Teller*$Result[3])-$MinPast)
                $Pro1=$resultcount1/($Teller/100)
                $Pro2=$resultcount2 /($Teller/100)
                $Part1="$([char]186)" * ($BS * $Teller)
                $Timestring="[" + $Part1 + "]    "
                $objLabel31.Text = "Zeit Passiert: $([math]::Round($MinPast, 5)) Min   "
                $objLabel32.Text = "Zeit notwendig: $([math]::Round($MinNeeded, 5)) Min   "            
                $objLabel33.Text = "Versuche: $I von $($Result[3])   "
                $objLabel34.Text = "Uneränderte Wahl: $resultcount1   "
                $objLabel35.Text = "Prozent:  $([math]::Round($Pro1, 3)) %   "
                $objLabel36.Text = "Eränderte Wahl: $resultcount2   "
                $objLabel37.Text = "Prozent:  $([math]::Round($Pro2, 3)) %   "
                $objLabel38.Text = $timestring
                $objForm3.Refresh()
                Sleep -s $Sleep
            
            }
        }
        $objForm3.Close()
        $objForm4 = New-Object System.Windows.Forms.Form
        $objForm4.StartPosition = "CenterScreen"
        $objForm4.Text = "[ Ergebnis ]"
        $objForm4.Size = New-Object System.Drawing.Size(500,240)
    
        $objLabel41 = New-Object System.Windows.Forms.Label
        $objLabel41.Location = New-Object System.Drawing.Size(49,20) 
        $objLabel41.Size = New-Object System.Drawing.Size(200,15)

        $objLabel42 = New-Object System.Windows.Forms.Label
        $objLabel42.Location = New-Object System.Drawing.Size(40,35) 
        $objLabel42.Size = New-Object System.Drawing.Size(200,15)

        $objLabel43 = New-Object System.Windows.Forms.Label
        $objLabel43.Location = New-Object System.Drawing.Size(63,60) 
        $objLabel43.Size = New-Object System.Drawing.Size(200,15)

        $objLabel44 = New-Object System.Windows.Forms.Label
        $objLabel44.Location = New-Object System.Drawing.Size(20,85) 
        $objLabel44.Size = New-Object System.Drawing.Size(200,15)

        $objLabel45 = New-Object System.Windows.Forms.Label
        $objLabel45.Location = New-Object System.Drawing.Size(72,100) 
        $objLabel45.Size = New-Object System.Drawing.Size(200,15)

        $objLabel46 = New-Object System.Windows.Forms.Label
        $objLabel46.Location = New-Object System.Drawing.Size(34,120) 
        $objLabel46.Size = New-Object System.Drawing.Size(200,15)

        $objLabel47 = New-Object System.Windows.Forms.Label
        $objLabel47.Location = New-Object System.Drawing.Size(72,135) 
        $objLabel47.Size = New-Object System.Drawing.Size(200,15)

        $Time2=Get-Date
        $MinPast=($Time2-$Time1).TotalMinutes  
        $MinNeeded=0
        $Pro1=$resultcount1/($Result[3]/100)
        $Pro2=$resultcount2 /($Result[3]/100)

        $objLabel41.Text = "Zeit Passiert: $([math]::Round($MinPast, 5)) Min   "
        $objForm4.Controls.Add($objLabel41)
        $objLabel42.Text = "Zeit notwendig: $([math]::Round($MinNeeded, 5)) Min   "            
        $objForm4.Controls.Add($objLabel42)
        $objLabel43.Text = "Versuche: $I von $($Result[3])   "
        $objForm4.Controls.Add($objLabel43)
        $objLabel44.Text = "Uneränderte Wahl: $resultcount1   "
        $objForm4.Controls.Add($objLabel44)
        $objLabel45.Text = "Prozent:  $([math]::Round($Pro1, 3)) %   "
        $objForm4.Controls.Add($objLabel45)
        $objLabel46.Text = "Eränderte Wahl: $resultcount2   "
        $objForm4.Controls.Add($objLabel46)
        $objLabel47.Text = "Prozent:  $([math]::Round($Pro2, 3)) %   "
        $objForm4.Controls.Add($objLabel47)

        $CancelButton41 = New-Object System.Windows.Forms.Button
        $CancelButton41.Location = New-Object System.Drawing.Size(40,160)
        $CancelButton41.Size = New-Object System.Drawing.Size(70,30)
        $CancelButton41.Text = "Fertig....."
        $CancelButton41.Add_Click({$objForm4.Close()})
        $objForm4.Controls.Add($CancelButton41)
        
        $objForm4.Add_Shown({$objForm4.Activate()})
        [void]$objForm4.ShowDialog()
    }
}While($DG)

 