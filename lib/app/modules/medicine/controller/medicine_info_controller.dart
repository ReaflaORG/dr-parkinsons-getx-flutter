// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

class MedicineInfoController extends GetxController {
  static MedicineInfoController get to => Get.find();

  // Data ▼ ============================================

  // Function ▼ ========================================

  // Variable ▼ ========================================
  /// 약제명
  Rx<String> medicine_name = ''.obs;

  @override
  Future<void> onInit() async {
    medicine_name.value = Get.arguments['name'];
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
