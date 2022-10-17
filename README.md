# 플러터 기본 베이스(GetX)

플러터 프로젝트를 빠르게 진행하기 위한 기본 베이스 (GetX)

매번 프로젝트 생성하여 여러 설정을 하는것이 귀찮습니다.  
프로젝트를 시작할때 아래 기본 베이스로 설정된 상태에서 몇가지만 변경하여 개발을 바로 시작하기 위해서 만든 베이스 프로젝트 입니다.

---

## 버전 정보

Version 1.1.4

---

## 다트 정보

[Dart 2.18.1](https://dart.dev/get-dart/archive)  
[DevTools 2.15.0](https://dart.dev/get-dart/archive)

---

## 플러터 정보

[Flutter 3.3.2(channel stable)](https://docs.flutter.dev/development/tools/sdk/releases)  
※ 하위 버젼에서도 가능합니다.

---

## 프레임워크

[GetX](https://pub.dev/packages/get)

---

## 안드로이드 정보

### build.gradle

"android\build.gradle"

```
ext.kotlin_version = '1.7.10'
classpath 'com.android.tools.build:gradle:7.3.0'
```

### gradle.properties

"android\gradle.properties"  
Gradle에서 사용하는 최적의 JVM 가비지 수집기를 구성하여 빌드 성능을 개선할 수 있습니다. JDK 8은 기본적으로 병렬 가비지 수집기를 사용하도록 구성되어 있지만, JDK 9 이상에서는 G1 가비지 수집기를 사용하도록 구성됩니다.

빌드 성능을 개선하려면 병렬 가비지 수집기로 Gradle 빌드를 테스트하는 것이 좋습니다. gradle.properties에서 다음을 설정합니다.

```
org.gradle.jvmargs=-Xmx1536M -XX:+UseParallelGC
```

### gradle-wrapper.properties

"android\gradle\wrapper\gradle-wrapper.properties"

```
distributionUrl=https\://services.gradle.org/distributions/gradle-7.4.2-all.zip
```

### app\build.gradle

<img src="https://postfiles.pstatic.net/MjAyMjA1MTRfMyAg/MDAxNjUyNTA5NDk4NjU0.fIImQ3l912o0KImUXQp0xQ6CpM2kPV28PK8c3Sxcb5og.nzsvnMoWbqZJcQOzOGI9D_9ubUa4nzh1ya6py6G6rfAg.PNG.phongdaegi/image.png?type=w773" width="100%" alt="사용자 비율" />   
2022년 기준 롤리팝(21) 혹은 마시멜로(23) 기준으로 설정해주면 됩니다.   
[자세한 내용확인](https://blog.naver.com/phongdaegi/222732273987)
"android\local.properties"   
```
flutter.flutterCompileSdkVersion=33   
flutter.flutterTargetSdkVersion=33   
flutter.flutterMinSdkVersion=20   
flutter.versionName=1.0.0   
flutter.versionCode=1
```

---

## 안드로이드 최적화

### build.gradle

#### 릴리즈 모드 옵션 추가

```
release {
    signingConfig signingConfigs.debug
    minifyEnabled true
    debuggable false
}
```

#### 디버그 모드 옵션 추가

```
debug {
    minifyEnabled false
    debuggable true
    aaptOptions.cruncherEnabled = false
}
```

#### 여러개의 APK 생성 제한

화면 밀도나 ABI(Application Binary Interface)에 따라 여러 개의 APK를 빌드하는 작업에는 시간이 소요되기 때문에 비활성화

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

#### 덱스 메모리 할당량 처리

```
dexOptions {
    javaMaxHeapSize = "4g"
}
```

---

## analysis_options

린트 옵션 최적화 및 추가

---

## 패키지 이름 변경

VSCODE 기준  
CTRL + SHIFT + F5 단축키로  
아래 값을 지정하여 전체 변경  
"com.gilhospital.
parkinsons"

---

## 환경 설정

최상위 디렉토리에 .env 파일 값 수정

---

## pubspec.yaml

하단 값 변경

```
name
description
publish_to
```

---
