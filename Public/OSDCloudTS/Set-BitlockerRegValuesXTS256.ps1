

function Set-BitlockerRegValuesXTS256 {
    Write-Host "Create Bitlocker RegValues" -ForegroundColor DarkGray
    if ($env:SystemDrive -eq 'X:') {
        $WindowsPhase = 'WinPE'
    }
    if ($WindowsPhase -eq 'WinPE'){
        Invoke-Exe reg load HKLM\TempSOFTWARE "C:\Windows\System32\Config\SOFTWARE"
        Invoke-Exe reg add HKLM\TempSOFTWARE\Policies\Microsoft\FVE /V EncryptionMethodWithXtsOs /T REG_DWORD /D 7 /F
        Invoke-Exe reg add HKLM\TempSOFTWARE\Policies\Microsoft\FVE /V EncryptionMethodWithXtsFdv /T REG_DWORD /D 7 /F
        Invoke-Exe reg add HKLM\TempSOFTWARE\Policies\Microsoft\FVE /V EncryptionMethodWithXtsRdv /T REG_DWORD /D 3 /F
        Invoke-Exe reg add HKLM\TempSOFTWARE\Policies\Microsoft\FVE /V OSEncryptionType /T REG_DWORD /D 1 /F
        Invoke-Exe reg add HKLM\TempSOFTWARE\Policies\Microsoft\FVE /V OSAllowedHardwareEncryptionAlgorithms /T REG_DWORD /D 0 /F
        Invoke-Exe reg unload HKLM\TempSOFTWARE
    }
    else {
        Invoke-Exe reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /V EncryptionMethodWithXtsOs /T REG_DWORD /D 7 /F
        Invoke-Exe reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /V EncryptionMethodWithXtsFdv /T REG_DWORD /D 7 /F
        Invoke-Exe reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /V EncryptionMethodWithXtsRdv /T REG_DWORD /D 3 /F
        Invoke-Exe reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /V OSEncryptionType /T REG_DWORD /D 1 /F
        Invoke-Exe reg add HKLM\SOFTWARE\Policies\Microsoft\FVE /V OSAllowedHardwareEncryptionAlgorithms /T REG_DWORD /D 0 /F
    }
}