// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../modules/doctor/binding/doctor_binding.dart';
import '../modules/doctor/view/doctor_view.dart';
import '../modules/healthcare/binding/drugmisuse_binding.dart';
import '../modules/healthcare/binding/healthcare_binding.dart';
import '../modules/healthcare/view/drugmisuse_view.dart';
import '../modules/healthcare/view/healthcare_view.dart';
import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';
import '../modules/main/binding/main_binding.dart';
import '../modules/main/view/main_view.dart';
import '../modules/medicine/binding/medicine_binding.dart';
import '../modules/medicine/binding/medicine_info_binding.dart';
import '../modules/medicine/view/medicine_info_view.dart';
import '../modules/medicine/view/medicine_view.dart';
import '../modules/mission/binding/mission_binding.dart';
import '../modules/mission/view/mission_view.dart';
import '../modules/myinfo/binding/myinfo_binding.dart';
import '../modules/myinfo/view/myinfo_view.dart';
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
    GetPage(
      title: '메인',
      name: Routes.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '홈',
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '건강관리',
      name: Routes.HEALTHCARE,
      page: () => const HealthCareView(),
      binding: HealthCareBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),

    /// 건강관리 - 약물검색
    GetPage(
      title: '약물검색',
      name: Routes.MEDICINE,
      page: () => const MedicineView(),
      binding: MedicineBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),

    /// 건강관리 - 약물검색 - 약물정보
    GetPage(
      title: '약물정보',
      name: Routes.MEDICINEINFO,
      page: () => const MedicineInfoView(),
      binding: MedicineInfoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),

    /// 건강관리 - 주의약품
    GetPage(
      title: '주의해야할 약',
      name: Routes.DRUGMISUSE,
      page: () => const DrugMisuseView(),
      binding: DrugMisuseBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),

    /// 건강관리 - 자가진단
    GetPage(
      title: '자가진단',
      name: Routes.MEDICINE,
      page: () => const MedicineView(),
      binding: MedicineBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '미션관리',
      name: Routes.MISSION,
      page: () => const MissionView(),
      binding: MissionBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '주치의찾기',
      name: Routes.DOCTOR,
      page: () => const DoctorView(),
      binding: DoctorBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
    GetPage(
      title: '내정보',
      name: Routes.MY_INFO,
      page: () => const MyInfoView(),
      binding: MyInfoBinding(),
      transition: Transition.fadeIn,
      transitionDuration: Duration.zero,
      curve: Curves.easeIn,
      popGesture: false,
    ),
  ];
}
