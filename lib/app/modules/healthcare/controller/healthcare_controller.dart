// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../models/healthcare_btn_model.dart';

class HealthCareController extends GetxController {
  static HealthCareController get to => Get.find();

  // Data ▼ ============================================
  RxList<HealthCareBtnModel> btns = <HealthCareBtnModel>[
    HealthCareBtnModel(
        name: '약물검색',
        color: ColorPath.PrimaryLightColor,
        icon: 'assets/images/icons/3d/48pharmacy.png',
        onClick: () {
          Get.toNamed(Routes.MEDICINE);
        }),
    HealthCareBtnModel(
        name: '주의해야할 약',
        color: ColorPath.TertiaryLightColor,
        icon: 'assets/images/icons/3d/48pill1.png',
        onClick: () {
          Get.toNamed(Routes.DRUGMISUSE);
        }),
    HealthCareBtnModel(
        name: '파킨슨 자가진단',
        color: ColorPath.SecondaryLightColor,
        icon: 'assets/images/icons/3d/48test1.png',
        onClick: () {
          Get.toNamed(Routes.DIAGNOSIS);
        }),
    HealthCareBtnModel(
        name: '파킨슨 심리진단',
        color: ColorPath.SecondaryLightColor,
        icon: 'assets/images/icons/3d/48test2.png',
        onClick: () {
          Get.toNamed(Routes.DIAGNOSIS);
        }),
    HealthCareBtnModel(
        name: '수면장애진단',
        color: ColorPath.SecondaryLightColor,
        icon: 'assets/images/icons/3d/48test3.png',
        onClick: () {
          Get.toNamed(Routes.DIAGNOSIS);
        }),
    HealthCareBtnModel(
        name: '미션관리',
        color: ColorPath.Background1HECEFF1,
        icon: 'assets/images/icons/3d/48timer.png',
        onClick: () {
          Get.toNamed(Routes.MISSION);
        }),
  ].obs;

  // Function ▼ ========================================

  // Variable ▼ ========================================

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
