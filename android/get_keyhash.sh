#!/bin/bash
# 카카오 로그인용 키 해시 확인 스크립트 (Bash/Linux/Mac)

echo "========================================="
echo "카카오 로그인 키 해시 확인"
echo "========================================="
echo ""

# 디버그 키스토어 경로
DEBUG_KEYSTORE="$HOME/.android/debug.keystore"
DEBUG_PASSWORD="android"

# 릴리스 키스토어 경로 확인
if [ -f "android/app/key.properties" ]; then
    RELEASE_KEYSTORE=$(grep "storeFile=" android/app/key.properties | cut -d'=' -f2 | tr -d ' ')
    RELEASE_PASSWORD=$(grep "storePassword=" android/app/key.properties | cut -d'=' -f2 | tr -d ' ')
    KEY_ALIAS=$(grep "keyAlias=" android/app/key.properties | cut -d'=' -f2 | tr -d ' ')
    
    if [ ! -f "$RELEASE_KEYSTORE" ] && [ -f "android/app/$RELEASE_KEYSTORE" ]; then
        RELEASE_KEYSTORE="android/app/$RELEASE_KEYSTORE"
    fi
fi

# Java keytool 경로 찾기
if [ -z "$JAVA_HOME" ]; then
    # Flutter의 Java 사용
    FLUTTER_PATH=$(which flutter)
    if [ -n "$FLUTTER_PATH" ]; then
        FLUTTER_DIR=$(dirname $(dirname $FLUTTER_PATH))
        JAVA_HOME=$(find "$FLUTTER_DIR/bin/cache" -name "java" -type f 2>/dev/null | head -1 | xargs dirname | xargs dirname)
    fi
fi

if [ -z "$JAVA_HOME" ]; then
    echo "Java를 찾을 수 없습니다. JAVA_HOME을 설정하거나 Java를 설치하세요."
    exit 1
fi

KEYTOOL="$JAVA_HOME/bin/keytool"

if [ ! -f "$KEYTOOL" ]; then
    echo "keytool을 찾을 수 없습니다: $KEYTOOL"
    exit 1
fi

echo "1. 디버그 키 해시 확인 중..."
if [ -f "$DEBUG_KEYSTORE" ]; then
    DEBUG_HASH=$(keytool -exportcert -alias androiddebugkey -keystore "$DEBUG_KEYSTORE" -storepass "$DEBUG_PASSWORD" 2>/dev/null | openssl sha1 -binary | openssl base64)
    if [ $? -eq 0 ]; then
        echo "디버그 키 해시: $DEBUG_HASH"
        echo ""
    else
        echo "디버그 키 해시 확인 실패"
    fi
else
    echo "디버그 키스토어를 찾을 수 없습니다: $DEBUG_KEYSTORE"
    echo ""
fi

echo "2. 릴리스 키 해시 확인 중..."
if [ -n "$RELEASE_KEYSTORE" ] && [ -f "$RELEASE_KEYSTORE" ] && [ -n "$RELEASE_PASSWORD" ] && [ -n "$KEY_ALIAS" ]; then
    RELEASE_HASH=$(keytool -exportcert -alias "$KEY_ALIAS" -keystore "$RELEASE_KEYSTORE" -storepass "$RELEASE_PASSWORD" 2>/dev/null | openssl sha1 -binary | openssl base64)
    if [ $? -eq 0 ]; then
        echo "릴리스 키 해시: $RELEASE_HASH"
        echo ""
    else
        echo "릴리스 키 해시 확인 실패"
    fi
else
    echo "릴리스 키스토어 정보를 찾을 수 없습니다."
    echo ""
fi

echo "========================================="
echo "카카오 개발자 콘솔에 위 키 해시를 등록하세요:"
echo "https://developers.kakao.com/console/app"
echo "앱 설정 > 플랫폼 > Android 플랫폼 > 키 해시"
echo "========================================="
