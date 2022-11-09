// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../models/drugmisuse_infobox_model.dart';

class DrugMisuseController extends GetxController {
  static DrugMisuseController get to => Get.find();
  // Data ▼ ============================================
  RxList<DrugMisuseInfoBoxModel> boxes = <DrugMisuseInfoBoxModel>[
    DrugMisuseInfoBoxModel(title: 'test', text: 'text testing texting test'),
    DrugMisuseInfoBoxModel(title: 'test', text: 'text testing texting test'),
    DrugMisuseInfoBoxModel(title: 'test', text: 'text testing texting test'),
  ].obs;

  // RxList<
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
