// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/main_provider.dart';
import '../widgets/show_dialog.dart';

// suggest policy controller
class SuggestPolicyController extends GetxController {
  static SuggestPolicyController get to => Get.find();

  // Data ▼ ============================================

  // EditController ▼ ========================================
  Rx<TextEditingController> policyTitleController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> policyContentController =
      TextEditingController(text: '').obs;

  // FocusNode ▼ ========================================
  Rx<FocusNode> polityTitleFoucesNode = FocusNode().obs;
  Rx<FocusNode> policyContentFoucesNode = FocusNode().obs;

  // * 에러 리스트
  Rx<String> polityTitleError = ''.obs;
  Rx<String> policyContentError = ''.obs;

  Rx<bool> boxStatusWithPersonalAgree = false.obs;
  Rx<bool> boxStatusWithAnonymous = false.obs;

  changeCheckBoxWithPersonalAgree(value) {
    boxStatusWithPersonalAgree.value = value;
  }

  changeCheckBoxWithAnonymous(value) {
    boxStatusWithAnonymous.value = value;
  }

  // Function ▼ ========================================
  // * 데이터 수정하기 API
  Future<void> handleSubmit(BuildContext context) async {
    if (policyTitleController.value.text.isEmpty) {
      polityTitleError.value = '제목은 필수입니다.';
    } else {
      polityTitleError.value = '';
    }

    if (policyContentController.value.text.isEmpty) {
      policyContentError.value = '내용은 필수입니다.';
    } else {
      policyContentError.value = '';
    }

    if (boxStatusWithPersonalAgree.isFalse) {
      GlobalToastWidget(message: '개인정보 처리방침에 체크해 주세요.');
      return;
    }

    if (boxStatusWithAnonymous.isFalse) {
      GlobalToastWidget(message: '익명 전송에 체크해 주세요.');
      return;
    }

    if (polityTitleError.value.isNotEmpty ||
        policyContentError.value.isNotEmpty) {
      return;
    }

    try {
      Map<String, dynamic> request = {
        'title': policyTitleController.value.text,
        'description': policyContentController.value.text,
      };
      AuthBaseResponseModel response = await AuthProvider.dio(
          method: 'POST', url: '/myinfo/policy', requestModel: request);
      switch (response.statusCode) {
        case 201:
          policyTitleController.value.text = '';
          policyContentController.value.text = '';

          boxStatusWithPersonalAgree.value = false;
          boxStatusWithAnonymous.value = false;

          //await GlobalToastWidget(message: '정책 제안이 완료되었습니다.');
          await showAlertDialog(context, '정책 제안 발신 완료',
              '작성된 제안은 닥터 파킨슨 관리자에게 전송되어 향후 정책 결정의 자료로 사용됩니다.\n소중한 의견에 감사합니다.');
          //Get.back();
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

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
