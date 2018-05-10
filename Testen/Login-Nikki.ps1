<#





#>

function LetsTalk
{
param(
    [Parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [string]$Say
)
    Add-Type -AssemblyName System.speech
    $sayThis = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $sayThis.SelectVoice('Microsoft David Desktop')
    $sayThis.Speak($Say)
}


function ShowImage
{
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$showFile
    )   

# Loosely based on http://www.vistax64.com/powershell/202216-display-image-powershell.html
[void][reflection.assembly]::LoadWithPartialName("System.Windows.Forms")

$file = (get-item $showFile)
$img = [System.Drawing.Image]::Fromfile($file);

# This tip from http://stackoverflow.com/questions/3358372/windows-forms-look-different-in-powershell-and-powershell-ise-why/3359274#3359274
[System.Windows.Forms.Application]::EnableVisualStyles();
$form = new-object Windows.Forms.Form
$form.Text = 'Imageviewer'
$form.Width = $img.Size.Width;
$form.Height =  $img.Size.Height;
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width =  $img.Size.Width;
$pictureBox.Height =  $img.Size.Height;

$pictureBox.Image = $img;
$form.controls.add($pictureBox)
$form.Add_Shown( { $form.Activate() } )
    LetsTalk -Say 'Ahoy Nikki'
    letsTalk -Say 'Why do you go on this magicbox'
    LetsTalk -Say 'It is a great day outside'
    LetsTalk -Say 'Just listen to Captain Jack Sparrow'
$form.ShowDialog()
$form.Dispose();
}

try 
{
    ShowImage -showFile 'E:\Shoots\2018-04-21-22 Sullen\Bewerkt\_RRR0034-klein.jpg'
}
catch
{
    throw    
}


