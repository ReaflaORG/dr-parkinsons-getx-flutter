// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/base_response_model.dart';
import 'package:dr_parkinsons/app/models/faq_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../provider/provider.dart';

// faq controller
class FaqController extends GetxController {
  static FaqController get to => Get.find();

  //**
  // 1. 모델 정의 = API 확인
  // 2. 변수 할당
  // 3. 초기화 API 로 데이터 받기
  // 4. 뷰와 데이터 바인딩 [싱크 ]
  // */

  // Data ▼ ============================================
  // FAQ Model
  RxList<FaqModel> faqData = <FaqModel>[].obs;
  Rx<bool> process = true.obs;

  // Function ▼ ========================================

  /// * get FAQ Data from API
  Future<void> getFaqData() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/myinfo/question',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          faqData.assignAll(List.generate(response.data.length,
              (index) => FaqModel.fromJson(response.data[index])));
          process.value = false;
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString());
    }
  }
  // Variable ▼ ========================================

  @override
  Future<void> onInit() async {
    await getFaqData();
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
