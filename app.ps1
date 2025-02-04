# //-----------------------------------------------------------------------//
# //    D R I V E   L E T T E R     A S S I G N M E N T     F I X E R      //
# //                                                                       //
# //    Copyright (c) 2025 schaffer-edp. All rights reserved.              //
# //    Author: Linus Groschke                                             //
# //-----------------------------------------------------------------------//

# Read configuration from file
$Config = Get-Content -Path 'config.json' | ConvertFrom-Json

# Loop through all configured assignments
foreach ($Entry in $Config.PSObject.Properties){
    $DriveLabel = $Entry.Name
    $DriveLetter = $Entry.Value + ":"

    # Get drive instance by label
    $Drive = Get-CimInstance -ClassName Win32_Volume -Filter "Label = '$DriveLabel'"    
    if(!$Drive) {
        # Error if no drive with specified label was found
        Write-Error "Drive with label $DriveLabel not found"
        continue
    }

    # Check if letter of drive is as expected
    if ($Drive.DriveLetter -ne $DriveLetter) {
        # Change drive letter
        $Drive | Set-CimInstance -Property @{DriveLetter = $DriveLetter; Label = $DriveLabel}
        Write-Host "Letter of drive $DriveLabel changed to $DriveLetter"
    }
}