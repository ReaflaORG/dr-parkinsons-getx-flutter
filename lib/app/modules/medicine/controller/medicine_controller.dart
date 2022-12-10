// ignore_for_file: unnecessary_overrides
import 'dart:async';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../model/medicine_btn_model.dart';

class MedicineController extends GetxController {
  static MedicineController get to => Get.find();

  // Data ▼ ============================================

  List<MedicineBtnModel> pillBtns = <MedicineBtnModel>[
    MedicineBtnModel(
        name: '도파민제',
        icon: 'assets/images/icons/3d/48mpill1.png',
        onClick: () {
          Get.toNamed(Routes.MEDICINEINFO, arguments: {'name': '도파민제'});
        }),
    MedicineBtnModel(
        name: '복합체',
        icon: 'assets/images/icons/3d/48mpill2.png',
        onClick: () {
          Get.toNamed(Routes.MEDICINEINFO, arguments: {'name': '복합제'});
        }),
    MedicineBtnModel(
        name: '도파민 작용제',
        icon: 'assets/images/icons/3d/48mpill3.png',
        onClick: () {
          Get.toNamed(Routes.MEDICINEINFO, arguments: {'name': '도파민 작용제'});
        }),
    MedicineBtnModel(
        name: '콤트 억제제',
        icon: 'assets/images/icons/3d/48mpill4.png',
        onClick: () {
          Get.toNamed(Routes.MEDICINEINFO, arguments: {'name': '콤트 억제제'});
        }),
    MedicineBtnModel(
        name: '마오비 억제제',
        icon: 'assets/images/icons/3d/48mpill5.png',
        onClick: () {
          Get.toNamed(Routes.MEDICINEINFO, arguments: {'name': '마오비 억제제'});
        }),
    MedicineBtnModel(
        name: '기타약제',
        icon: 'assets/images/icons/3d/48mpill6.png',
        onClick: () {
          Get.toNamed(Routes.MEDICINEINFO, arguments: {'name': '기타약제'});
        }),
  ];

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
