// ignore_for_file: constant_identifier_names, unused_field

part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  /// 스플래시
  static const SPLASH = _Paths.SPLASH;
}

abstract class _Paths {
  _Paths._();

  /// 스플래시
  static const SPLASH = '/splash';
}
