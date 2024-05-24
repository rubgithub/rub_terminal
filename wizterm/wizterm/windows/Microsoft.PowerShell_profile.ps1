# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/blueish.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/spaceship.omp.json" | Invoke-Expression
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/pure.omp.json" | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

Import-Module -Name Terminal-Icons
# ini untuk alias tambahan personal
New-Alias ci code-insiders
New-Alias v nvim
New-Alias ll ls
New-Alias c code
New-Alias python3 python
New-Alias n neovide
# New-Alias black python -m black
$host.ui.RawUI.WindowTitle = “Titulo”
clear -x
# Personalize the console
#$Host.UI.RawUI.WindowTitle = "Windows Powershell " + $Host.Version;

# Draw welcome screen  
$terminal = @"
  _____                   _             _ 
 |_   _|                 (_)           | |
   | | ___ _ __ _ __ ___  _ _ __   __ _| |
   | |/ _ \ '__| '_ ` _ \| | '_ \ / _` | |
   | |  __/ |  | | | | | | | | | | (_| | |
   \_/\___|_|  |_| |_| |_|_|_| |_|\__,_|_|
                                          
"@

Write-Host -ForegroundColor DarkYellow $terminal

