// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/globals/global_toast_widget.dart';
import 'package:base/app/models/welfare_model.dart';
import 'package:base/app/modules/main/controller/main_controller.dart';
import 'package:base/app/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../models/healthcare_btn_model.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';

class HealthCareController extends GetxController {
  static HealthCareController get to => Get.find();

  //**
  //* Step 1 복지혜택 모델링하기 [x]

  //* Step 2 복지혜택 변수 변언하기 [x]

  //* Step 3 api 받아와서 복지혜택 변수에 할당하기 [x]
  //* Step 4 View와 맞추기
  // */
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
          // Get.toNamed('${Routes.DIAGNOSIS}/1');
          GlobalReadyModal(context: Get.overlayContext as BuildContext);
        }),
    HealthCareBtnModel(
        name: '파킨슨 심리진단',
        color: ColorPath.SecondaryLightColor,
        icon: 'assets/images/icons/3d/48test2.png',
        onClick: () {
          Get.toNamed('${Routes.DIAGNOSIS}/2');
        }),
    HealthCareBtnModel(
        name: '수면장애진단',
        color: ColorPath.SecondaryLightColor,
        icon: 'assets/images/icons/3d/48test3.png',
        onClick: () {
          Get.toNamed('${Routes.DIAGNOSIS}/3');
        }),
    HealthCareBtnModel(
        name: '미션관리',
        color: ColorPath.Background1HECEFF1,
        icon: 'assets/images/icons/3d/48timer.png',
        onClick: () {
          // Get.toNamed(Routes.MISSION);
          MainController.to.navigationIndex.value = 2;
        }),
  ].obs;

  // Function ▼ ========================================
  /// 데이터 초기화 함수
  Future<void> onInitData() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/healthcare',
      );

      switch (response.statusCode) {
        case 200:
          welfareLists.assignAll(List<WelfareModel>.from(
              response.data.map((e) => WelfareModel.fromJson(e))));
          Logger().d(welfareLists.length);
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  // Variable ▼ ========================================
  /// 복지 혜택 리스트 변수
  RxList<WelfareModel> welfareLists = <WelfareModel>[].obs;

  @override
  Future<void> onInit() async {
    await onInitData();
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
