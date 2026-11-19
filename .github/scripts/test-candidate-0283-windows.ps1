[CmdletBinding()]
param(
    [Parameter(Mandatory)][string]$CandidateDirectory,
    [Parameter(Mandatory)][string]$BaselineInstaller,
    [Parameter(Mandatory)][string]$OutputDirectory
)
$ErrorActionPreference = 'Stop'
if ($env:GITHUB_ACTIONS -ne 'true' -or $env:RUNNER_OS -ne 'Windows' -or
    !$env:RUNNER_TEMP -or !$env:GITHUB_RUN_ID -or
    (Get-Process DRAKETAX2025,UpTax -ErrorAction SilentlyContinue)) {
    throw 'Install QA requires a disposable GitHub Windows runner without Drake or UpTax.'
}
$qaRoot = Join-Path $env:RUNNER_TEMP ('uptax-install-qa-' + $env:GITHUB_RUN_ID)
if (Test-Path -LiteralPath $qaRoot) { throw 'Refusing to reuse an install QA directory.' }
New-Item -ItemType Directory -Path $qaRoot,$OutputDirectory -Force | Out-Null
$installRoot = Join-Path $qaRoot 'installed'
$sevenZip = (Get-Command 7z.exe -ErrorAction Stop).Source
$expected = [ordered]@{
    version = '0.2.83'
    sourceCommit = 'f600b9bd8a9485cd82c7c7327e6fc3a255e1aef0'
    baselineSha256 = '4f638f989963379d2ee43646080baeb53b3ae8e605cebbb6f3ff74e56a844ebe'
    installerSha256 = '5411d9bfb1529376a9032293a8c92df7e3acd5dbe705a536c87dd1c054403df9'
    blockmapSha256 = '73f3a4522860c399313e6531c0b48e8aeb8ce993bccbb428eb741d4d8a7ceff2'
    metadataSha256 = '87f23a13004fbdbd790cb286d39a5096d997da1e125711d6053ff1a3a853843f'
}
$report = [ordered]@{
    schemaVersion = 1
    version = $expected.version
    baselineTag = 'v0.2.78'
    baselineReleaseId = 442233846
    candidateTag = 'v0.2.83'
    sourceCommit = $expected.sourceCommit
    baselineInstallerSha256 = $expected.baselineSha256
    candidateInstallerSha256 = $expected.installerSha256
    startedUtc = [DateTime]::UtcNow.ToString('o')
    status = 'running'
}

function Check-Hash([string]$File,[string]$Expected) {
    if ($Expected -notmatch '^[a-f0-9]{64}$' -or (Get-FileHash -LiteralPath $File -Algorithm SHA256).Hash.ToLowerInvariant() -ne $Expected) { throw 'QA asset hash mismatch.' }
}
function Run-Installer([string]$File) {
    if ($installRoot -match '\s') { throw 'The isolated NSIS destination must have no spaces.' }
    $process = Start-Process -FilePath $File -ArgumentList @('/S',('/D='+$installRoot)) -WindowStyle Hidden -PassThru
    if (!$process.WaitForExit(180000) -or $process.ExitCode -ne 0) { throw 'Isolated installer did not exit successfully.' }
}
function Stop-OwnedApp {
    foreach ($process in @(Get-Process UpTax -ErrorAction SilentlyContinue)) {
        if ($process.Path -and $process.Path.StartsWith($installRoot + '\',[StringComparison]::OrdinalIgnoreCase)) {
            Stop-Process -Id $process.Id -Force
            $process.WaitForExit(30000) | Out-Null
        }
    }
}
function Expand-Installer([string]$File,[string]$Label) {
    $stub = Join-Path $qaRoot ($Label+'-stub')
    $payload = Join-Path $qaRoot ($Label+'-payload')
    & $sevenZip x $File ('-o'+$stub) -y | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'NSIS extraction failed.' }
    $archives = @(Get-ChildItem -LiteralPath $stub -Recurse -Filter 'app-64.7z' -File)
    if ($archives.Count -ne 1) { throw 'Expected one x64 installer payload.' }
    & $sevenZip x $archives[0].FullName ('-o'+$payload) -y | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'Payload extraction failed.' }
    return $payload
}
function Compare-Installed([string]$Payload) {
    $files = @(Get-ChildItem -LiteralPath $Payload -Recurse -File)
    foreach ($file in $files) {
        $relative = [IO.Path]::GetRelativePath($Payload,$file.FullName)
        $installed = Join-Path $installRoot $relative
        if (!(Test-Path -LiteralPath $installed -PathType Leaf) -or
            (Get-FileHash -LiteralPath $installed -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).Hash) { throw 'Installed bytes differ from the exact installer payload.' }
    }
    $extra = @(Get-ChildItem -LiteralPath $installRoot -Recurse -File | Where-Object {
        $relative = [IO.Path]::GetRelativePath($installRoot,$_.FullName)
        !(Test-Path -LiteralPath (Join-Path $Payload $relative) -PathType Leaf) -and $relative -notmatch '^Uninstall[^\\]*\.exe$'
    })
    if ($extra.Count) { throw 'Unexpected installed files.' }
    return $files.Count
}
function Read-Renderer([string]$Socket) {
    $client = [Net.WebSockets.ClientWebSocket]::new()
    $deadline = [Threading.CancellationTokenSource]::new(15000)
    try {
        $client.ConnectAsync([Uri]$Socket,$deadline.Token).GetAwaiter().GetResult()
        $expression = '({url:location.href,ready:document.readyState,login:/sign in|log in/i.test(document.body.innerText)})'
        $request = @{id=1;method='Runtime.evaluate';params=@{expression=$expression;returnByValue=$true}} | ConvertTo-Json -Compress -Depth 5
        $bytes = [Text.Encoding]::UTF8.GetBytes($request)
        $client.SendAsync([ArraySegment[byte]]::new($bytes),[Net.WebSockets.WebSocketMessageType]::Text,$true,$deadline.Token).GetAwaiter().GetResult()
        $buffer = [byte[]]::new(65536)
        do {
            $stream = [IO.MemoryStream]::new()
            do {
                $result = $client.ReceiveAsync([ArraySegment[byte]]::new($buffer),$deadline.Token).GetAwaiter().GetResult()
                $stream.Write($buffer,0,$result.Count)
            } while (!$result.EndOfMessage)
            $message = [Text.Encoding]::UTF8.GetString($stream.ToArray()) | ConvertFrom-Json
            $stream.Dispose()
        } while ($message.id -ne 1)
        return $message.result.result.value
    } finally { $client.Dispose(); $deadline.Dispose() }
}
try {
    Check-Hash $BaselineInstaller $expected.baselineSha256
    Check-Hash (Join-Path $CandidateDirectory 'UpTax-Setup-0.2.83.exe') $expected.installerSha256
    Check-Hash (Join-Path $CandidateDirectory 'UpTax-Setup-0.2.83.exe.blockmap') $expected.blockmapSha256
    Check-Hash (Join-Path $CandidateDirectory 'latest.yml') $expected.metadataSha256
    $candidate = Join-Path $CandidateDirectory 'UpTax-Setup-0.2.83.exe'
    $baselinePayload = Expand-Installer $BaselineInstaller 'baseline'
    $candidatePayload = Expand-Installer $candidate 'candidate'
    Run-Installer $BaselineInstaller
    Stop-OwnedApp
    $report.baselineInstalledFiles = Compare-Installed $baselinePayload
    $baselineVersion = [Diagnostics.FileVersionInfo]::GetVersionInfo((Join-Path $installRoot 'UpTax.exe')).ProductVersion
    if ($baselineVersion -ne '0.2.78.0') { throw 'Baseline product version mismatch.' }
    $report.baselineProductVersion = $baselineVersion
    Run-Installer $candidate
    Stop-OwnedApp
    $report.upgradedInstalledFiles = Compare-Installed $candidatePayload
    $report.sameDirectoryUpgrade = $true
    $executable = Join-Path $installRoot 'UpTax.exe'
    $report.productVersion = [Diagnostics.FileVersionInfo]::GetVersionInfo($executable).ProductVersion
    if ($report.productVersion -ne '0.2.83.0') { throw 'Installed product version mismatch.' }
    $pe = [IO.File]::ReadAllBytes($executable)
    $peOffset = [BitConverter]::ToInt32($pe,0x3c)
    if ([BitConverter]::ToUInt16($pe,$peOffset+4) -ne 0x8664) { throw 'Installed application is not Windows x64.' }
    $report.architecture = 'x64'
    $profile = Join-Path $qaRoot 'profile'
    Start-Process -FilePath $executable -ArgumentList @("--user-data-dir=$profile",'--remote-debugging-port=9337','--disable-gpu','--no-sandbox') -WindowStyle Hidden | Out-Null
    $renderer = $null
    for ($attempt=0; $attempt -lt 60; $attempt++) {
        Start-Sleep -Seconds 2
        try {
            $pages = Invoke-RestMethod 'http://127.0.0.1:9337/json/list' -TimeoutSec 3
            foreach ($page in $pages) {
                if ($page.type -ne 'page' -or $page.url -notlike 'https://app.uptax.ai/*') { continue }
                $value = Read-Renderer $page.webSocketDebuggerUrl
                if ($value.ready -eq 'complete' -and $value.login) { $renderer=$value; break }
            }
        } catch { }
        if ($renderer) { break }
    }
    if (!$renderer) { throw 'The exact installed candidate did not render its signed-out login screen.' }
    $report.loginRendered = $true
    Stop-OwnedApp
    $uninstallers = @(Get-ChildItem -LiteralPath $installRoot -File -Filter 'Uninstall*.exe')
    if ($uninstallers.Count -ne 1) { throw 'Expected exactly one isolated uninstaller.' }
    $uninstaller = Start-Process -FilePath $uninstallers[0].FullName -ArgumentList '/S' -WindowStyle Hidden -PassThru
    if (!$uninstaller.WaitForExit(120000) -or $uninstaller.ExitCode -ne 0) { throw 'Isolated uninstall failed.' }
    for ($attempt=0; $attempt -lt 60 -and (Test-Path -LiteralPath $installRoot); $attempt++) { Start-Sleep -Seconds 1 }
    if (Test-Path -LiteralPath $installRoot) { throw 'The isolated installation remained after uninstall.' }
    $report.uninstalled = $true
    $report.status = 'passed'
} catch {
    $report.status = 'failed'
    $report.errorType = $_.Exception.GetType().FullName
    throw
} finally {
    Stop-OwnedApp
    $report.completedUtc = [DateTime]::UtcNow.ToString('o')
    $report | ConvertTo-Json -Depth 6 | Set-Content -Encoding utf8 (Join-Path $OutputDirectory 'windows-install-qa.json')
}
