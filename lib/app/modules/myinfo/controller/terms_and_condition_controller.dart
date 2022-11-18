// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:get/get.dart';

import '../models/terms_and_condition_item_model.dart';

// terms and condition controller
class TermsAndConditionController extends GetxController {
  static TermsAndConditionController get to => Get.find();

  // Data ▼ ============================================
  // terms and condition item model
  RxList<TermsAndConditionItemModel> listArray = [
    TermsAndConditionItemModel(
        title: '약관',
        content:
            '파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다.'),
    TermsAndConditionItemModel(
        title: '정책',
        content:
            '파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다.')
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
