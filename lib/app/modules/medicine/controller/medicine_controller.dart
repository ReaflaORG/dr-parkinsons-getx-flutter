// ignore_for_file: unnecessary_overrides
import 'dart:async';

import 'package:get/get.dart';

import '../model/medicine_btn_model.dart';

class MedicineController extends GetxController {
  static MedicineController get to => Get.find();

  // Data ▼ ============================================

  List<MedicineBtnModel> pillBtns = <MedicineBtnModel>[
    MedicineBtnModel(
        name: '도파민제',
        icon: 'assets/images/icon/3d/48mpill1.png',
        onClick: () {}),
    MedicineBtnModel(
        name: '복합체',
        icon: 'assets/images/icon/3d/48mpill2.png',
        onClick: () {}),
    MedicineBtnModel(
        name: '도파민 작용제',
        icon: 'assets/images/icon/3d/48mpill3.png',
        onClick: () {}),
    MedicineBtnModel(
        name: '콤트 억제제',
        icon: 'assets/images/icon/3d/48mpill4.png',
        onClick: () {}),
    MedicineBtnModel(
        name: '마오비 억제제',
        icon: 'assets/images/icon/3d/48mpill5.png',
        onClick: () {}),
    MedicineBtnModel(
        name: '기타약제',
        icon: 'assets/images/icon/3d/48mpill6.png',
        onClick: () {}),
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