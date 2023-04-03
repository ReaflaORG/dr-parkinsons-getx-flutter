import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

/// 파이어베이스 인증 서비스
class FirebaseAuthService extends GetxService {
  static FirebaseAuthService get to => Get.find();

  // 파이어베이스 인증 인스턴스
  FirebaseAuth fireAuthInstance = FirebaseAuth.instance;

  /// `generateNonce` 함수는 주어진 길이 만큼의 무작위 문자열을 생성합니다. 기본적으로 길이는 32이며,
  ///
  /// 길이를 지정하지 않으면 기본값인 32를 사용합니다. 사용되는 문자셋은 숫자, 대문자, 소문자, '-', '.', '' 입니다.
  String generateNonce([int length = 32]) {
    // 이 코드는 `generateNonce` 함수에서 사용되는 문자셋으로, 무작위 문자열을 생성할 때 사용됩니다.
    // 이 문자셋은 숫자, 대문자, 소문자, '-', '.' 문자들로 이루어져 있습니다.
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

    // 보안을 위해 "Random.secure()"를 사용하여 안전한 무작위성을 보장합니다.
    final random = Random.secure();
    // "List.generate" 함수를 사용하여 지정된 길이 만큼의 무작위 문자열을 생성합니다.
    // 이 때, "charset" 문자열에서 무작위 인덱스를 선택하여 문자열을 생성합니다.
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// `sha256ofString` 함수는 주어진 문자열의 SHA-256 해시값을 반환합니다.
  ///
  /// 이 함수는 문자열을 UTF-8로 인코딩하여 바이트 배열로 변환하고, SHA-256 해시 함수를 사용하여 바이트 배열의 해시값을 계산합니다.
  ///
  /// 마지막으로, 해시값을 16진수 문자열로 변환하여 반환합니다.
  String sha256ofString(String input) {
    // 문자열을 바이트 배열로 인코딩합니다.
    final bytes = utf8.encode(input);
    // SHA-256 해시 함수를 사용하여 해시값을 계산합니다.
    final digest = sha256.convert(bytes);
    // 해시값을 16진수 문자열로 변환하여 반환합니다.
    return digest.toString();
  }

  /// 애플 로그인
  Future<UserCredential> signInWithApple() async {
    // `generateNonce` 함수를 사용하여 무작위 문자열과 SHA-256 해시값을 생성합니다.
    // 이 값을 사용하여 Apple 로그인을 요청합니다.
    // 주의: `rawNonce`와 `nonce` 값은 서로 다르기 때문에 두 값 모두 사용되어야 합니다.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Apple 로그인 요청을 위해 `SignInWithApple.getAppleIDCredential` 함수를 사용합니다.
    // 이 함수는 Apple ID 자격증명을 가져와 사용자 정보와 인증 토큰을 반환합니다.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );

    // 가져온 Apple 자격증명으로 `OAuthProvider`에서 인증 자격증명을 생성합니다.
    // 이를 위해 `idToken`과 `rawNonce` 값을 전달합니다.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
    );

    // 인증 자격증명으로 Firebase에 로그인하고 `UserCredential`을 반환합니다.
    return await fireAuthInstance.signInWithCredential(oauthCredential);
  }
}
