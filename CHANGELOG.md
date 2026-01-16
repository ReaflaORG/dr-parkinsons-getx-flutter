# 변경 사항 (Changelog)

## [2024.XX.XX] - Android 15 호환성 및 빌드 시스템 업데이트

### 🚀 주요 변경사항

#### Android 15 호환성

- **Android SDK 36 지원**: `compileSdk` 및 `targetSdk`를 36으로 업데이트하여
  Android 15 호환성 확보
- **Edge-to-edge 디스플레이 지원**: Android 15의 Edge-to-edge 디스플레이를 위한
  설정 추가
  - `MainActivity.kt`에 `WindowCompat.setDecorFitsSystemWindows(window, false)`
    추가
  - `androidx.core:core-ktx:1.12.0` 의존성 추가
- **Deprecated API 제거**: Android 15에서 지원 중단된 API 제거
  - `setStatusBarColor`, `setNavigationBarColor`, `setNavigationBarDividerColor`
    제거
  - `SystemUiOverlayStyle`로 대체

#### 빌드 시스템 업데이트

- **Android Gradle Plugin**: `8.6.0` → `8.9.1`
- **Gradle Wrapper**: `8.7` → `8.11.1`
- **Kotlin**: `1.9.22` → `2.1.0`
- **Core Library Desugaring**: Java 8+ API 지원을 위한 desugaring 활성화
  - `coreLibraryDesugaringEnabled true` 설정
  - `com.android.tools:desugar_jdk_libs:2.1.4` 의존성 추가

#### 보안 업데이트

- **reCAPTCHA Enterprise SDK**: `18.1.2` → `18.8.0` (심각한 보안 취약점 패치)
- **Firebase BOM**: `31.3.0` → `33.7.0`

### 📦 패키지 업데이트 및 마이그레이션

#### 주요 패키지 업데이트

- `dio`: `^5.9.0` (보안 취약점 패치 및 API 변경 대응)
- `intl`: `^0.20.2` (Flutter 호환성)
- `syncfusion_flutter_datepicker`: `^32.1.23`
- `flutter_local_notifications`: `^19.5.0`
- `device_info_plus`: `^12.0.0`
- `app_settings`: `^7.0.0`
- `fluttertoast`: `^9.0.0`
- `location`: `^8.0.0`
- `image_picker`: `^0.8.6` → `^1.1.2`
- `webview_flutter`: `^4.13.1`
- `youtube_player_iframe`: `^5.2.2`
- `carousel_slider`: `^4.1.1` → `^5.1.1` (Material 3 호환성)
- `flutter_widget_from_html_core`: `^0.9.0+2` → `^0.15.2`
- `youtube_player_flutter`: `^8.1.2` → `^9.0.0`

#### 패키지 마이그레이션

- `wakelock` → `wakelock_plus`: `^1.2.8`
- `package_info` → `package_info_plus`: `^9.0.0`
- `flutter_plugin_android_lifecycle`: `^2.0.17` (명시적 추가)

### 🔧 코드 변경사항

#### Flutter v1 Embedding 제거

다음 패키지들의 v1 embedding 코드를 제거하여 Flutter 최신 버전과 호환:

- `flutter_plugin_android_lifecycle`
- `path_provider_android`
- `permission_handler_android`
- `sqflite`

#### API 변경 대응

- **Dio 패키지**: `DioError` → `DioException`, timeout 값 `int` → `Duration`
- **carousel_slider**: `CarouselController` → `CarouselSliderController`
  (Material 3 호환성)
- **TextTheme**: Material 3 속성으로 업데이트 (`bodyText2`, `headline6` 등 제거)

#### 성능 최적화

- **Gradle 빌드 성능 향상**:
  - JVM 힙 크기: `1536M` → `4096M`
  - Gradle 데몬, 병렬 빌드, 빌드 캐시 활성화
  - Kotlin 증분 컴파일 캐시 문제 해결

### 📝 문서화

#### 추가된 문서

- `android/KAKAO_KEYHASH_README.md`: 카카오 로그인 키 해시 확인 및 등록 가이드
- `android/get_keyhash.ps1`: Windows용 키 해시 확인 스크립트
- `android/get_keyhash.sh`: Linux/Mac용 키 해시 확인 스크립트

### ⚠️ 주의사항

#### 카카오 로그인 설정

- 디버그 모드에서 카카오 로그인을 사용하려면 카카오 개발자 콘솔에 디버그 키 해시
  를 등록해야 합니다
- 키 해시 확인 방법은 `android/KAKAO_KEYHASH_README.md` 참조

#### 빌드 요구사항

- **최소 Java 버전**: Java 11 이상 권장
- **메모리**: 빌드 시 최소 8GB RAM 권장
- **Android SDK**: SDK 36 설치 필요

### 🐛 버그 수정

- Kotlin 버전 호환성 문제 해결 (Kotlin 2.2.0으로 컴파일된 라이브러리 호환)
- Android Gradle Plugin 8.9.1과 Gradle 8.11.1 호환성 문제 해결
- Java heap space 오류 해결 (메모리 할당 증가)
- Flutter v1 embedding 관련 컴파일 오류 해결

### 🔄 마이그레이션 가이드

#### 개발자용

1. **의존성 업데이트**:

   ```bash
   flutter clean
   flutter pub get
   ```

2. **Gradle 캐시 정리**:

   ```bash
   cd android
   ./gradlew clean
   ```

3. **카카오 키 해시 등록** (필요시):
   - 디버그 키 해시 확인 및 카카오 개발자 콘솔에 등록
   - 자세한 내용은 `android/KAKAO_KEYHASH_README.md` 참조

#### 빌드 시스템

- Android Gradle Plugin과 Gradle 버전이 자동으로 업데이트됩니다
- 첫 빌드 시 Gradle wrapper가 새 버전을 다운로드할 수 있습니다

---

## 기술 스택 버전

### 빌드 도구

- Android Gradle Plugin: `8.9.1`
- Gradle: `8.11.1`
- Kotlin: `2.1.0`

### Android 설정

- `compileSdk`: `36`
- `targetSdk`: `36`
- `minSdk`: `28`

### 주요 의존성

- Flutter SDK: (현재 프로젝트 버전)
- Firebase BOM: `33.7.0`
- reCAPTCHA Enterprise SDK: `18.8.0`

---

**참고**: 이 업데이트는 Android 15 호환성을 위한 주요 변경사항을 포함합니다. 빌
드 전에 위의 마이그레이션 가이드를 확인하시기 바랍니다.
