// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:get/get.dart';

import '../models/view_my_symptoms_item_model.dart';

// view my symptoms controller
class ViewMySymptomsController extends GetxController {
  static ViewMySymptomsController get to => Get.find();

  // Data ▼ ============================================
  // view symptoms item model
  ViewMySymptomsItemModel listArray = ViewMySymptomsItemModel(
      title: '배아픔',
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
