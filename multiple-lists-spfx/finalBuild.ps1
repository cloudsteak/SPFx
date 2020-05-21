

clear
Write-Host "###################################    Increase build number   ###################################"
$psfile = Get-Content '.\config\package-solution.json' -raw | ConvertFrom-Json
$version = $psfile.solution.version
Write-Host "Old version number: " $version
$newVersion = $version.Split('.')[0] + '.' + $version.Split('.')[1] + '.' + $version.Split('.')[2] + '.' + ([INT]$version.Split('.')[3] + 1)
$psfile.solution.version = $newVersion
Write-Host "New version number: " $newVersion
$psfile | ConvertTo-Json -depth 32| set-content '.\config\package-solution.json'

Write-Host "###################################    gulp clean    ###################################"
gulp clean
# Write-Host "###################################    gulp build    ###################################"
# gulp build
Write-Host "###################################    gulp bundle --ship    ###################################"
gulp bundle --ship
Write-Host "###################################    gulp package-solution --ship    ###################################"
gulp package-solution --ship