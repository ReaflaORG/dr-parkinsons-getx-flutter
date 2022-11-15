// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:get/get.dart';

import '../models/my_symptoms_item_model.dart';

// my symptoms controller
class MySymptomsController extends GetxController {
  static MySymptomsController get to => Get.find();

  // Data ▼ ============================================
  // my symptoms item model
  RxList<MySymptomsItemModel> listArray = [
    MySymptomsItemModel(symptom: '발열', dateWritten: '10.17'),
    MySymptomsItemModel(symptom: '꼬이는 증상', dateWritten: '10.17'),
    MySymptomsItemModel(symptom: '오후 3시경 통증', dateWritten: '10.17'),
    MySymptomsItemModel(symptom: '오후 메모', dateWritten: '10.17')
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
