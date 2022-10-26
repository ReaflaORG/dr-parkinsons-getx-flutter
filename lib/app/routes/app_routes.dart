// ignore_for_file: constant_identifier_names, unused_field

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  /// 테마 화면 (사용자에게 노출되지 않음)
  static const THEME = _Paths.THEME;

  /// 스플래시
  static const SPLASH = _Paths.SPLASH;

  /// 권한 동의 안내 화면
  static const PERMISSION = _Paths.PERMISSION;

  /// 로그인 및 온보딩 화면
  static const SIGNIN = _Paths.SIGNIN;

  /// 메인
  static const MAIN = _Paths.MAIN;

  /// 홈
  static const HOME = _Paths.HOME;

  /// 건강관리
  static const HEALTHCARE = _Paths.HEALTHCARE;

  /// 미션관리
  static const MISSION = _Paths.MISSION;

  /// 주치의찾기
  static const DOCTOR = _Paths.DOCTOR;

  /// 내정보
  static const MY_INFO = _Paths.MY_INFO;
}

abstract class _Paths {
  _Paths._();

  /// 테마 화면 (사용자에게 노출되지 않음)
  static const THEME = '/theme';

  /// 스플래시
  static const SPLASH = '/splash';

  /// 권한 동의 안내 화면
  static const PERMISSION = '/permission';

  /// 로그인 및 온보딩 화면
  static const SIGNIN = '/signin';

  /// 메인
  static const MAIN = '/main';

  /// 홈
  static const HOME = '/home';

  /// 건강관리
  static const HEALTHCARE = '/healthcare';

  /// 미션관리
  static const MISSION = '/mission';

  /// 주치의찾기
  static const DOCTOR = '/doctor';

  /// 내정보
  static const MY_INFO = '/myinfo';
}
