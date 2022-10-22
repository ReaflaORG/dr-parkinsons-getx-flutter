// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../modules/splash/binding/splash_binding.dart';
import '../modules/splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      title: '스플래시',
      name: INITIAL,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 800),
      curve: Curves.easeIn,
      popGesture: false,
    ),
  ];
}
