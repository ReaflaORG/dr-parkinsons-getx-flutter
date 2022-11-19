// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

class DiagnosisController extends GetxController {
  static DiagnosisController get to => Get.find();

  // Data ▼ ============================================

  // Function ▼ ========================================

  // Variable ▼ ========================================

  // 테스트가 진행중일때 True
  RxBool isTesting = true.obs;

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
