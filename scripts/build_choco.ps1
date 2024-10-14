$packageName = "winid"
$version = $env:TAG_VERSION.TrimStart('v') -replace '[^0-9\.]', ''

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Cria o arquivo Nuspec
@"
<package>
  <metadata>
    <id>$packageName</id>
    <version>$version</version>
    <title>UUID for C</title>
    <authors>Danilo Silva</authors>
    <owners>Danilo Silva</owners>
    <summary>O pacote de UUID (Universally Unique Identifier) no Windows para C permite a criação, manipulação e utilização de identificadores únicos universais em programas escritos em C. Um UUID é um número de 128 bits, que é amplamente utilizado em sistemas de software para identificar informações de forma única, sem a necessidade de coordenar com outras partes.</summary>
    <description>O pacote de UUID (Universally Unique Identifier) no Windows para C permite a criação, manipulação e utilização de identificadores únicos universais em programas escritos em C. Um UUID é um número de 128 bits, que é amplamente utilizado em sistemas de software para identificar informações de forma única, sem a necessidade de coordenar com outras partes.</description>
    <tags>uuid</tags>
    <docsUrl>https://github.com/kovarike/win-uuid-for-c-/wiki/winid</docsUrl>
    <bugTrackerUrl>https://github.com/kovarike/win-uuid-for-c-/issues</bugTrackerUrl>
    <releaseNotes>https://github.com/kovarike/win-uuid-for-c-/releases/tag/$version</releaseNotes>
    <projectUrl>https://github.com/kovarike/win-uuid-for-c-</projectUrl>
    <packageSourceUrl>https://github.com/kovarike/win-uuid-for-c-</packageSourceUrl>
    <licenseUrl>https://github.com/kovarike/win-uuid-for-c-/blob/main/LICENSE</licenseUrl>
  </metadata>
</package>
"@ | Set-Content "$toolsDir\$packageName.nuspec"

$rootDir = "$(Split-Path -Path $toolsDir -Parent)"

# Verifica se o arquivo LICENSE.txt existe na raiz do projeto antes de copiá-lo
$licenseFile = "$rootDir\LICENSE.txt"
if (Test-Path $licenseFile) {
    Copy-Item $licenseFile -Destination "$toolsDir\LICENSE.txt" -Force
} else {
    Write-Host "LICENSE.txt não encontrado na raiz do projeto."
}

# Cria o zip da biblioteca
$zipPath = Join-Path $toolsDir "$packageName.zip"
Compress-Archive -Path "$toolsDir\*" -DestinationPath $zipPath -Force

# Cria o arquivo VERIFICATION.txt
$sha256 = (Get-FileHash "$toolsDir\$packageName.zip" -Algorithm SHA256).Hash
@"
This package includes the following binary file:
- $packageName.zip

The binary was downloaded from the official repository:
https://github.com/kovarike/win-uuid-for-c-

To verify the integrity of the binary, compute the SHA256 hash and compare it with the following value:
SHA256($packageName.zip): $sha256
"@ | Set-Content "$toolsDir\VERIFICATION.txt"


# Empacota para o Chocolatey
choco pack $toolsDir\$packageName.nuspec

$apiKey = $env:CHOCO_API_KEY
$package = "$PWD\$packageName.$version.nupkg"

# Submeter o pacote para Chocolatey
choco push $package --api-key=$apiKey --source="https://push.chocolatey.org/"

