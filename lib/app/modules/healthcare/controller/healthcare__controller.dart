// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../models/healthcare_btn_model.dart';

class HealthCareController extends GetxController {
  static HealthCareController get to => Get.find();

  // Data ▼ ============================================
  RxList<HealthCareBtnModel> btns = <HealthCareBtnModel>[
    HealthCareBtnModel(
        name: "약물검색",
        color: ColorPath.PrimaryLightColor,
        icon: "assets/images/icon/3d/48 pill.png",
        onClick: () {
          print("1234");
        }),
    HealthCareBtnModel(
        name: "약물검색",
        color: ColorPath.PrimaryLightColor,
        icon: "assets/images/icon/3d/48 pill.png",
        onClick: () {
          print("1234");
        }),
    HealthCareBtnModel(
        name: "약물검색",
        color: ColorPath.PrimaryLightColor,
        icon: "assets/images/icon/3d/48 pill.png",
        onClick: () {
          print("1234");
        }),
    HealthCareBtnModel(
        name: "약물검색",
        color: ColorPath.PrimaryLightColor,
        icon: "assets/images/icon/3d/48 pill.png",
        onClick: () {
          print("1234");
        }),
    HealthCareBtnModel(
        name: "약물검색",
        color: ColorPath.PrimaryLightColor,
        icon: "assets/images/icon/3d/48 pill.png",
        onClick: () {
          print("1234");
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
