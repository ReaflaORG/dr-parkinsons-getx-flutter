// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:get/get.dart';

import '../models/write_my_symptoms_item_model.dart';

// write my symptoms controller
class WriteMySymptomsController extends GetxController {
  static WriteMySymptomsController get to => Get.find();

  // Data ▼ ============================================
  // write my symptoms item model
  WriteMySymptomsItemModel listArray = WriteMySymptomsItemModel(
      title: '파킨슨 일지(10.17)',
      dateWritten: '10월 17일 오후 3시 20분',
      content: '손발이 떨리고 몸이 굳으며....');

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
