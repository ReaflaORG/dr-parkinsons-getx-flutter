// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/welfare_model.dart';
import 'package:dr_parkinsons/app/modules/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../models/healthcare_btn_model.dart';
import '../../../provider/provider.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/color_path.dart';

class HealthCareController extends GetxController {
  static HealthCareController get to => Get.find();

  // Data ▼

  /// 메뉴 데이터
  RxList<HealthCareBtnModel> menuData = [
    HealthCareBtnModel(
      name: '약물검색',
      color: ColorPath.PrimaryLightColor,
      icon: 'assets/images/icons/medical_treatment/medical_treatment_14.webp',
      onClick: () {
        Get.toNamed(Routes.MEDICINE);
      },
    ),
    HealthCareBtnModel(
      name: '주의해야할 약',
      color: ColorPath.TertiaryLightColor,
      icon: 'assets/images/icons/medical_treatment/medical_treatment_9.webp',
      onClick: () {
        Get.toNamed(Routes.DRUGMISUSE);
      },
    ),
    HealthCareBtnModel(
      name: '파킨슨 자가진단',
      color: ColorPath.SecondaryLightColor,
      icon: 'assets/images/icons/medical_treatment/medical_treatment_15.webp',
      onClick: () {
        GlobalReadyModal(context: Get.overlayContext as BuildContext);
      },
    ),
    HealthCareBtnModel(
      name: '파킨슨 심리진단',
      color: ColorPath.SecondaryLightColor,
      icon: 'assets/images/icons/medical_treatment/medical_treatment_17.webp',
      onClick: () {
        Get.toNamed('${Routes.DIAGNOSIS}/2');
      },
    ),
    HealthCareBtnModel(
      name: '수면 장애진단',
      color: ColorPath.SecondaryLightColor,
      icon: 'assets/images/icons/medical_treatment/medical_treatment_33.webp',
      onClick: () {
        Get.toNamed('${Routes.DIAGNOSIS}/3');
      },
    ),
    HealthCareBtnModel(
      name: '미션관리',
      color: ColorPath.Background1HECEFF1,
      icon: 'assets/images/icons/medical_treatment/medical_treatment_35.webp',
      icon_width: 32,
      icon_height: 32,
      onClick: () {
        MainController.to.navigationCurrentIndex.value = 2;
      },
    ),
  ].obs;

  /// 복지 혜택 데이터
  RxList<WelfareModel> welfareData = <WelfareModel>[].obs;

  // Function ▼

  /// 복지 혜택 데이터 프로바이더
  Future<void> handleSocialWelfareProvider() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/healthcare',
      );

      switch (response.statusCode) {
        case 200:
          welfareData.assignAll(
            List<WelfareModel>.from(
              response.data.map(
                (e) => WelfareModel.fromJson(e),
              ),
            ),
          );
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  @override
  Future<void> onInit() async {
    await handleSocialWelfareProvider();

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
