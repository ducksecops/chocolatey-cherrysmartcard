$ErrorActionPreference = 'Stop'; # stop on all errors

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$installLocation = $toolsDir + "\CherrySmartCard-Setup_33_EN.msi"

$url        = 'https://www.cherry.de/files/software/CherrySmartCard-Setup_33_EN.zip'

$unzipArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  checksum      = '079CF6C2E6BBFD980341BD0D69D504BF44CB07325DD9701AEA4D341EAC4D1256'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @unzipArgs

$installArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'msi'
  file          = $installLocation


  softwareName  = 'Cherry SmartCard Package V3.3 Build 9'

  checksum      = '601D08A7E746E087C470A56C4685448F1BB4D4FFA811C7E48DAB026EA234135C'
  checksumType  = 'sha256'


  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyInstallPackage @installArgs