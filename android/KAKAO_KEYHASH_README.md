# 카카오 로그인 키 해시 확인 방법

카카오 로그인에서 "Android keyHash validation failed" 오류가 발생하는 경우, 카카
오 개발자 콘솔에 올바른 키 해시를 등록해야 합니다.

## 방법 1: PowerShell로 키 해시 확인 (Windows)

### 디버그 키 해시 확인

```powershell
cd android
keytool -exportcert -alias androiddebugkey -keystore "$env:USERPROFILE\.android\debug.keystore" -storepass android | certutil -hashfile - SHA1
```

출력된 두 번째 줄의 해시 값이 디버그 키 해시입니다.

### 릴리스 키 해시 확인

```powershell
cd android
keytool -exportcert -alias key -keystore app\key.jks -storepass "vkzlstms1!" | certutil -hashfile - SHA1
```

출력된 두 번째 줄의 해시 값이 릴리스 키 해시입니다.

## 방법 2: Bash로 키 해시 확인 (Linux/Mac)

### 디버그 키 해시 확인

```bash
cd android
keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android | openssl sha1 -binary | openssl base64
```

### 릴리스 키 해시 확인

```bash
cd android
keytool -exportcert -alias key -keystore app/key.jks -storepass "vkzlstms1!" | openssl sha1 -binary | openssl base64
```

## 방법 3: Flutter 앱에서 키 해시 확인

앱을 실행하고 로그를 확인하세요. 카카오 SDK가 자동으로 키 해시를 출력할 수 있습
니다.

또는 다음 코드를 임시로 추가하여 키 해시를 확인할 수 있습니다:

```dart
// main.dart의 initialize() 함수에 추가
if (kDebugMode && Platform.isAndroid) {
  try {
    final PackageInfo info = await PackageInfo.fromPlatform();
    // 키 해시는 카카오 SDK가 자동으로 확인합니다
    print('앱 패키지명: ${info.packageName}');
  } catch (e) {
    print('키 해시 확인 오류: $e');
  }
}
```

## 카카오 개발자 콘솔에 키 해시 등록

1. [카카오 개발자 콘솔](https://developers.kakao.com/console/app)에 로그인
2. 해당 앱 선택
3. **앱 설정** > **플랫폼** > **Android 플랫폼** 이동
4. **키 해시** 섹션에서 **키 해시 추가** 클릭
5. 위에서 확인한 **디버그 키 해시**와 **릴리스 키 해시**를 모두 등록
6. 저장 후 앱을 다시 실행

## 참고사항

- **디버그 빌드**: 디버그 키 해시 사용
- **릴리스 빌드**: 릴리스 키 해시 사용
- 두 키 해시를 모두 등록하면 디버그와 릴리스 빌드 모두에서 카카오 로그인이 작동
  합니다
- 키 해시는 대소문자를 구분하지 않지만, 공백이나 특수문자가 포함되지 않아야 합니
  다

## 문제 해결

키 해시를 등록했는데도 여전히 오류가 발생하는 경우:

1. 카카오 개발자 콘솔에서 키 해시가 올바르게 등록되었는지 확인
2. 앱을 완전히 종료하고 다시 실행
3. 카카오 SDK가 최신 버전인지 확인 (`pubspec.yaml`에서 `kakao_flutter_sdk` 버전
   확인)
4. `AndroidManifest.xml`에서 카카오 네이티브 앱 키가 올바르게 설정되었는지 확인
