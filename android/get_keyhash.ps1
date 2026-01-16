# 카카오 로그인용 키 해시 확인 스크립트 (PowerShell)

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "카카오 로그인 키 해시 확인" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
Write-Host ""

# 디버그 키스토어 경로
$debugKeystore = "$env:USERPROFILE\.android\debug.keystore"
$debugPassword = "android"

# 릴리스 키스토어 경로 확인
$keyProperties = Get-Content "android\app\key.properties" -ErrorAction SilentlyContinue
$releaseKeystore = ""
$releasePassword = ""
$keyAlias = ""

if ($keyProperties) {
    foreach ($line in $keyProperties) {
        if ($line -match "storeFile=(.+)") {
            $storeFile = $matches[1]
            if (Test-Path $storeFile) {
                $releaseKeystore = $storeFile
            } elseif (Test-Path "android\app\$storeFile") {
                $releaseKeystore = "android\app\$storeFile"
            }
        }
        if ($line -match "storePassword=(.+)") {
            $releasePassword = $matches[1]
        }
        if ($line -match "keyAlias=(.+)") {
            $keyAlias = $matches[1]
        }
    }
}

# Java keytool 경로 찾기
$javaHome = $env:JAVA_HOME
if (-not $javaHome) {
    # Flutter의 Java 사용
    $flutterPath = (Get-Command flutter -ErrorAction SilentlyContinue).Source
    if ($flutterPath) {
        $flutterDir = Split-Path (Split-Path $flutterPath)
        $javaPath = Get-ChildItem -Path "$flutterDir\bin\cache" -Filter "java.exe" -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($javaPath) {
            $javaHome = Split-Path (Split-Path $javaPath.DirectoryName)
        }
    }
}

if (-not $javaHome) {
    Write-Host "Java를 찾을 수 없습니다. JAVA_HOME을 설정하거나 Java를 설치하세요." -ForegroundColor Red
    exit 1
}

$keytool = "$javaHome\bin\keytool.exe"

if (-not (Test-Path $keytool)) {
    Write-Host "keytool을 찾을 수 없습니다: $keytool" -ForegroundColor Red
    exit 1
}

Write-Host "1. 디버그 키 해시 확인 중..." -ForegroundColor Yellow
if (Test-Path $debugKeystore) {
    try {
        $debugHash = & $keytool -exportcert -alias androiddebugkey -keystore $debugKeystore -storepass $debugPassword 2>&1 | Select-String -Pattern "keytool error" -NotMatch
        if ($LASTEXITCODE -eq 0) {
            $debugHashBytes = [System.Convert]::FromBase64String($debugHash)
            $sha1 = New-Object System.Security.Cryptography.SHA1CryptoServiceProvider
            $hashBytes = $sha1.ComputeHash($debugHashBytes)
            $debugKeyHash = [System.BitConverter]::ToString($hashBytes).Replace("-", "").ToLower()
            Write-Host "디버그 키 해시: $debugKeyHash" -ForegroundColor Green
            Write-Host ""
        } else {
            Write-Host "디버그 키 해시 확인 실패" -ForegroundColor Red
        }
    } catch {
        Write-Host "디버그 키 해시 확인 중 오류: $_" -ForegroundColor Red
    }
} else {
    Write-Host "디버그 키스토어를 찾을 수 없습니다: $debugKeystore" -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "2. 릴리스 키 해시 확인 중..." -ForegroundColor Yellow
if ($releaseKeystore -and (Test-Path $releaseKeystore) -and $releasePassword -and $keyAlias) {
    try {
        $releaseHash = & $keytool -exportcert -alias $keyAlias -keystore $releaseKeystore -storepass $releasePassword 2>&1 | Select-String -Pattern "keytool error" -NotMatch
        if ($LASTEXITCODE -eq 0) {
            $releaseHashBytes = [System.Convert]::FromBase64String($releaseHash)
            $sha1 = New-Object System.Security.Cryptography.SHA1CryptoServiceProvider
            $hashBytes = $sha1.ComputeHash($releaseHashBytes)
            $releaseKeyHash = [System.BitConverter]::ToString($hashBytes).Replace("-", "").ToLower()
            Write-Host "릴리스 키 해시: $releaseKeyHash" -ForegroundColor Green
            Write-Host ""
        } else {
            Write-Host "릴리스 키 해시 확인 실패" -ForegroundColor Red
        }
    } catch {
        Write-Host "릴리스 키 해시 확인 중 오류: $_" -ForegroundColor Red
    }
} else {
    Write-Host "릴리스 키스토어 정보를 찾을 수 없습니다." -ForegroundColor Yellow
    Write-Host ""
}

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host "카카오 개발자 콘솔에 위 키 해시를 등록하세요:" -ForegroundColor Cyan
Write-Host "https://developers.kakao.com/console/app" -ForegroundColor Cyan
Write-Host "앱 설정 > 플랫폼 > Android 플랫폼 > 키 해시" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
