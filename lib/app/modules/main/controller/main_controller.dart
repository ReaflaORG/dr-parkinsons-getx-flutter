// ignore_for_file: unnecessary_overrides, dead_null_aware_expression

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../doctor/controller/doctor_controller.dart';
import '../../doctor/view/doctor_view.dart';
import '../../healthcare/controller/healthcare__controller.dart';
import '../../healthcare/view/healthcare_view.dart';
import '../../home/controller/home_controller.dart';
import '../../home/view/home_view.dart';
import '../../mission/controller/mission_controller.dart';
import '../../mission/view/mission_view.dart';
import '../../myinfo/controller/myinfo_controller.dart';
import '../../myinfo/view/myinfo_view.dart';
import '../model/main_model.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();

  // Data ▼ ============================================\

  final List<NavigationModel> navigationData = [
    NavigationModel(
      title: '홈',
      image: 'assets/images/navigation/navigation_1.png',
      imageActive: 'assets/images/navigation/navigation_1_active.png',
    ),
    NavigationModel(
      title: '건강관리',
      image: 'assets/images/navigation/navigation_2.png',
      imageActive: 'assets/images/navigation/navigation_2_active.png',
      width: 27,
      height: 26,
    ),
    NavigationModel(
      title: '미션관리',
      image: 'assets/images/navigation/navigation_3.png',
      imageActive: 'assets/images/navigation/navigation_3_active.png',
      width: 27,
      height: 26,
    ),
    NavigationModel(
      title: '주치의찾기',
      image: 'assets/images/navigation/navigation_4.png',
      imageActive: 'assets/images/navigation/navigation_4_active.png',
      width: 27,
      height: 26,
    ),
    NavigationModel(
      title: '내정보',
      image: 'assets/images/navigation/navigation_5.png',
      imageActive: 'assets/images/navigation/navigation_5_active.png',
    ),
  ];

  // Variable ▼ ========================================

  Rx<int> subIndex = 0.obs;
  Rx<int> navigationIndex = 0.obs;

  // Funcion ▼ =========================================

  Widget handleScreen() {
    final map = [
      GetBuilder<HomeController>(
        builder: (_) => const HomeView(),
        init: HomeController(),
      ),
      GetBuilder<HealthCareController>(
        builder: (_) => const HealthCareView(),
        init: HealthCareController(),
      ),
      GetBuilder<MissionController>(
        builder: (_) => const MissionView(),
        init: MissionController(),
      ),
      GetBuilder<DoctorController>(
        builder: (_) => const DoctorView(),
        init: DoctorController(),
      ),
      GetBuilder<MyInfoController>(
        builder: (_) => const MyInfoView(),
        init: MyInfoController(),
      ),
    ];

    return map[navigationIndex.value] ?? const SizedBox.shrink();
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
