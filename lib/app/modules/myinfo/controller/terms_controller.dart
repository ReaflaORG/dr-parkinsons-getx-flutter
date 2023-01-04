// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../models/terms_and_condition_item_model.dart';

class TermsController extends GetxController {
  static TermsController get to => Get.find();

  // Data ▼

  RxList<TermsMenuModel> termsData = [
    TermsMenuModel(
      title: '개인정보처리방침',
      content:
          '파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다.',
      url: 'https://www.gilhospital.com/web/mobile/lemon2',
    ),
    TermsMenuModel(
      title: '이용방침',
      content:
          '파킨슨병의 진단에는 전문의의 병력청취와 신경학적 검사가 가장 중요합니다. 그 밖의 뇌 질환의 진단에 많이 이용되고 있는 MRI나 CT등의 기타 검사들은 대부분 보조적인 수단으로 파킨슨병 자체를 진단하는 목적보다는 파킨슨병과 혼동될 수 있는 다른 질환을 감별하기 위한 목적으로 이용됩니다.',
      url: 'https://www.gilhospital.com/web/mobile/lemon1',
    )
  ].obs;

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
