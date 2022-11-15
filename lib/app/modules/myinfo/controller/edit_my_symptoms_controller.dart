// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../models/edit_my_symptoms_item_model.dart';

// edity my symptoms controller
class EditMySymptomsController extends GetxController {
  static EditMySymptomsController get to => Get.find();

  // Data ▼ ============================================
  // edit my symptoms item model
  EditMySymptomsItemModel listArray = EditMySymptomsItemModel(
      title: '파킨슨일지',
      dateWritten: '10월 17일 오후 3시 20분',
      mySymptoms: '이이이이이이이이잉이',
      imagePath: 'assets/test/myimg.png');

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
