Function Test-DISMFromOSDCloudUSB {


    $OSDCloudUSB = Get-Volume.usb | Where-Object {($_.FileSystemLabel -match 'OSDCloud') -or ($_.FileSystemLabel -match 'BHIMAGE')} | Select-Object -First 1
    $ComputerProduct = (Get-MyComputerProduct)
    $ComputerManufacturer = (Get-MyComputerManufacturer -Brief)
    $DriverPath = "$($OSDCloudUSB.DriveLetter):\OSDCloud\DriverPacks\DISM\$ComputerManufacturer\$ComputerProduct"
    if (Test-Path $DriverPath){Return $true}
    else { Return $false}

}