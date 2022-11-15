// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../models/alarm_setting_item_model.dart';

// alarm setting controller
class AlarmSettingController extends GetxController {
  static AlarmSettingController get to => Get.find();

  // Data ▼ ============================================
  // alarm setting item model
  AlarmSettingItemModel listArray = AlarmSettingItemModel(
      isBasicAlarm: false,
      isMissionAlarm: false,
      isNewArticleAlarm: false,
      isSendTextMsgAlarm: false);

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
