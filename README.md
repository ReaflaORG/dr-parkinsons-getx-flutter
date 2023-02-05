# 닥터파킨슨

가천대 길병원, 질병관리청 국립보건연구원 프로젝트

<br>

### 프로젝트 버전 정보

Version 1.0.0

<br>

### 다트 정보

[Dart 2.19.1](https://dart.dev/get-dart/archive)  
[DevTools 2.20.1](https://dart.dev/get-dart/archive)

<br>

### 플러터 정보

[Flutter 3.7.1(channel stable)](https://docs.flutter.dev/development/tools/sdk/releases)

<br>

### 상태관리 프레임워크

[GetX](https://pub.dev/packages/get)

<br>

---

<br>

## VSCODE

`.vscode/launch.json`

<br>

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "base",
      "request": "launch",
      "type": "dart",
      "args": [
        "--dart-define=flutter.inspector.debugDescription=false",
        "--dart-define=flutter.jank=none",
        // 현재 IOS에서만 사용가능
        // "--enable-impeller"
      ]
    },
    {
      "name": "base (profile mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "profile"
    },
    {
      "name": "base (release mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "release"
    }
  ]
}
```

<br>

---

<br>

## 빌드 옵션

<br>

### 코드 난독화(Code Ofdombulization)

<br>

```
flutter build apk --obfuscate --split-debug-info=/<project-name>/<directory>
```

코드 난독화(Code Ofdombulization)는 다음 사항을 수정하는 앱의 바이너리는 이해하기 어렵게 만듭니다.
난독화는 함수와 클래스 이름을 숨기며, 컴파일된 Dart 코드를 통해 공격자가 어려워집니다. 전용 앱을 리버스 엔지니어링할 수 있습니다.
[더 알아보기](https://docs.flutter.dev/deployment/obfuscate)

<br>

---

<br>

## Skia Shader Language(SkSL)

💡 플러터 `3.7` 이후 `Impeller` 엔진이 정착되면, 사용 불가할 수 있음

<br>

### 실행

```
flutter run --profile --cache-sksl
```

<br>

### SKSL을 처음 실행하는 경우

```
flutter run --profile --cache-sksl --purge-persistent-cache
```

실행시킨 앱에서 데이터가 쌓일 수 있게 기능들을 모두 탭하여 확인합니다.
같은 터미널에서 `shift + m`을 눌러 대문자 `M`을 누르게 되면
해당 프로젝트 폴더에 `flutter_01.sksl` 이름 순으로 파일이 만들어 집니다.

<br>

### AOS 빌드

```
flutter build appbundle --bundle-sksl-path flutter_01.sksl.json
```

<br>

### IOS 빌드

```
flutter build ios --bundle-sksl-path flutter_01.sksl.json
```

위에서 `profile` 모드로 데이터를 쌓은 파일을 가지고 빌드하시면 됩니다.

<br>

---

<br>

## 안드로이드 정보

### build.gradle

`android\build.gradle`

```
ext.kotlin_version = '1.7.10'
classpath 'com.android.tools.build:gradle:7.2.0'
```

<br>

### gradle.properties

`android\gradle.properties`

```
org.gradle.jvmargs=-Xmx1536M -XX:+UseParallelGC
```

Gradle에서 사용하는 최적의 JVM 가비지 수집기를 구성하여 빌드 성능을 개선할 수 있습니다. JDK 8은 기본적으로 병렬 가비지 수집기를 사용하도록 구성되어 있지만, JDK 9 이상에서는 G1 가비지 수집기를 사용하도록 구성됩니다.

빌드 성능을 개선하려면 병렬 가비지 수집기로 Gradle 빌드를 테스트하는 것이 좋습니다. gradle.properties에서 다음을 설정합니다.

<br>

### gradle-wrapper.properties

`android\gradle\wrapper\gradle-wrapper.properties`

```
distributionUrl=https\://services.gradle.org/distributions/gradle-7.5-all.zip
```

<br>

### app\build.gradle

`android\local.properties`

<img src="https://postfiles.pstatic.net/MjAyMjA1MTRfMyAg/MDAxNjUyNTA5NDk4NjU0.fIImQ3l912o0KImUXQp0xQ6CpM2kPV28PK8c3Sxcb5og.nzsvnMoWbqZJcQOzOGI9D_9ubUa4nzh1ya6py6G6rfAg.PNG.phongdaegi/image.png?type=w773" width="100%" alt="디바이스 사용자 비율" />   
2022년 기준 롤리팝(21) 혹은 마시멜로(23) 기준으로 설정해주면 됩니다.

[더 알아보기](https://blog.naver.com/phongdaegi/222732273987)

<br>

```
flutter.flutterCompileSdkVersion=33
flutter.flutterTargetSdkVersion=33
flutter.flutterMinSdkVersion=28
flutter.versionName=1.0.0
flutter.versionCode=1
```

<br>

#### 릴리즈 모드 옵션 추가

```
release {
    signingConfig signingConfigs.debug
    minifyEnabled true
    debuggable false
}
```

<br>

#### 디버그 모드 옵션 추가

```
debug {
    minifyEnabled false
    debuggable true
    aaptOptions.cruncherEnabled = false
}
```

<br>

#### 여러개의 APK 생성 제한

```
splits {
    abi {
        enable = false
    }
    density {
        enable = false
    }
}
```

화면 밀도나 ABI(Application Binary Interface)에 따라 여러 개의 APK를 빌드하는 작업에는 시간이 소요되기 때문에 비활성화

<br>

#### 덱스 메모리 할당량 처리

```
dexOptions {
    javaMaxHeapSize = "4g"
}
```

<br>

---

<br>

## analysis_options

응용 프로그램, 패키지 및 플러그인의 모범 코딩 관행을 권장하는 규칙 집합입니다.

```
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    non_constant_identifier_names: false
    undefined_identifier: false
    unnecessary_overrides: false
    unnecessary_null_comparison: false
    constant_identifier_names: false
    override_on_non_overriding_member: false
    prefer_single_quotes: true
    use_build_context_synchronously: false
    prefer_typing_uninitialized_variables: false
    use_super_parameters: true
    unnecessary_cast: false
```

[더 알아보기](https://github.com/flutter/flutter/blob/master/analysis_options.yaml)

<br>

---

<br>

## 패키지 이름 변경

`com.reafla.base` 값을 지정하여 전체 변경

<br>

---

<br>

## 환경 설정

최상위 디렉토리에 .env 파일 값 수정

<br>

---

<br>

## pubspec.yaml

하단 값 변경

```
name
description
publish_to
```

<br>

---

<br>
