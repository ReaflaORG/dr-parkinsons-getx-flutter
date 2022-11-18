// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:get/get.dart';

import '../models/faq_listview_item_model.dart';

// faq controller
class FaqController extends GetxController {
  static FaqController get to => Get.find();

  // Data ▼ ============================================
  // faq item model
  RxList<FaqItemModel> listArray = [
    FaqItemModel(
        question: "Q. 파킨슨병의 진단은 어떻게 하나요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다."),
    FaqItemModel(
        question: "Q. 회원가입은 어떻게 하나요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다."),
    FaqItemModel(
        question: "Q. 내 주치의 변경은 어떻게 하나요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다."),
    FaqItemModel(
        question: "Q. 긴급 연락 시스템은 무엇인가요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다."),
    FaqItemModel(
        question: "Q. 보호자 연락은 어떻게 하나요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다."),
    FaqItemModel(
        question: "Q. 주의해야 할 약품은 무엇인가요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다."),
    FaqItemModel(
        question: "Q. 주의해야 할 약품을 섭취했을때는 어떻게 해야 하나요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다."),
    FaqItemModel(
        question: "Q. 회원가입은 어떻게 하나요?",
        content:
            "파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다.")
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
