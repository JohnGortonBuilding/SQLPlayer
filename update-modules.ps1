- [azure.datafactory.tools - ver.0.97.0](https://www.powershellgallery.com/packages/azure.datafactory.tools/0.97.0)
- [Az.DataFactory - ver.1.16.6](https://www.powershellgallery.com/packages/Az.DataFactory/1.16.6)
- [Az.Accounts - ver.2.5.3](https://www.powershellgallery.com/packages/Az.Accounts/2.5.3)
- [Az.Resources - ver.4.3.1](https://www.powershellgallery.com/packages/Az.Resources/4.3.1)

$target = 'd:\modules'
Remove-Item -Path "$target\*" -Force

function Download-Module {
    param ([String] $m, [String]$target)

    update-module $m -Force
    $list = get-module $m -ListAvailable
    $mod = $list[0]
    $folder = Split-Path $mod.Path -Parent
    mkdir "$target`\$m"
    Copy-Item -Path "$folder\*" -Destination "$target`\$m" -Recurse
    $mod
}



$m = 'azure.datafactory.tools'
Download-Module -m $m -target $target

$m = 'Az.DataFactory'
Download-Module -m $m -target $target

$m = 'Az.Accounts'
Download-Module -m $m -target $target

$m = 'Az.Resources'
Download-Module -m $m -target $target
