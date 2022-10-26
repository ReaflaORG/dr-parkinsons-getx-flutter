// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../modules/permission/binding/permission_binding.dart';
import '../modules/permission/view/permission_view.dart';
import '../modules/signin/binding/signin_binding.dart';
import '../modules/signin/view/signin_view.dart';
import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';
import '../modules/theme/binding/theme_binding.dart';
import '../modules/theme/view/theme_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      title: '테마 화면 (사용자에게 노출되지 않음)',
      name: Routes.THEME,
      page: () => const ThemeView(),
      binding: ThemeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '스플래시 화면',
      name: INITIAL,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '권한 동의 안내 화면',
      name: Routes.PERMISSION,
      page: () => const PermissionView(),
      binding: PermissionBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '로그인 및 온보딩 화면',
      name: Routes.SIGNIN,
      page: () => const SignInView(),
      binding: SignInBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
  ];
}
