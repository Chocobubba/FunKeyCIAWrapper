$BASEDIR = pwd

If (Test-Path $BASEDIR\input.csv) {
    Write-Output "Loading file `"input.csv`""
    $CSV = Import-Csv "input.csv"
    } Else { 
     Read-Host -Prompt "Script could not find file `"input.csv`"!`nPress ENTER to exit"
     Exit
    }


Write-Output "Testing for target folder..."
If(!(Test-Path -Path "$BASEDIR\CIAs")) {
    New-Item -ItemType directory -Path $BASEDIR\CIAs | Out-Null
    Write-Output "Creating directory CIAs"
    } Else {
    Write-Output "Directory already exists"
    }

Write-Output "`nProcessing `"input.csv`"..."
foreach ($item in $CSV) {
    Write-Output "Building Ticket for $($item.Name)"
    python FunKeyCIA.py -ticketsonly -title $($item.TitleID) -key $($item.TitleKey)
    Rename-Item $BASEDIR\Tickets\$($item.TitleID).tik -NewName "$($item.Name).tik"
    Write-Output `n
    }

    Read-Host -Prompt "Processing complete!  Press ENTER to exit"