// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:get/get.dart';

import '../models/profile_setting_item_model.dart';

// profile setting controller
class ProfileSettingController extends GetxController {
  static ProfileSettingController get to => Get.find();

  // Data ▼ ============================================
  // profile setting item model
  ProfileSettingItemModel listArray = ProfileSettingItemModel(
      name: '김하나',
      mobile: '010-0000-0000',
      gaurdianName: '보호자',
      gaurdianMobile: '010-9999-9999',
      gender: 'F',
      aging: '40',
      resultDiagnosis: '초기',
      dateSuspicious: '2022-01-01');

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
