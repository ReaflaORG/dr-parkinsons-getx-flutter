// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:get/get.dart';

import '../models/suggest_policy_item_model.dart';

// suggest policy controller
class SuggestPolicyController extends GetxController {
  static SuggestPolicyController get to => Get.find();

  // Data ▼ ============================================
  // suggest policy item model
  SuggestPolicyItemModel listArray = SuggestPolicyItemModel(
      title: '정책제안합니다.',
      dateWritten: '10월 17일 오후 3시 20분',
      content: '내용ㅇ이이ㅣ이이이이이이이이이이이이',
      isAgreePersonalInfo: false,
      isSendAnonymous: false);

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
