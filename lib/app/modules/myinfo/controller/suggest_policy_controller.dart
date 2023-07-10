// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';
import '../widgets/show_dialog.dart';

class SuggestPolicyController extends GetxController {
  static SuggestPolicyController get to => Get.find();

  // Controller ▼

  /// 제안하기 제목 텍스트 에디팅 컨트롤러
  Rx<TextEditingController> titleController = TextEditingController().obs;

  /// 제안하기 내용 텍스트 에디팅 컨트롤러
  Rx<TextEditingController> contentController = TextEditingController().obs;

  // FocusNode ▼

  Rx<FocusNode> titleFoucesNode = FocusNode().obs;
  Rx<FocusNode> contentFoucesNode = FocusNode().obs;

  // Variable ▼

  /// 제목 에러
  Rx<String> titleError = ''.obs;

  /// 내용 에러
  Rx<String> contentError = ''.obs;

  Rx<bool> boxStatusWithPersonalAgree = false.obs;
  Rx<bool> boxStatusWithAnonymous = false.obs;

  /// 저장 버튼 활성화 여부
  Rx<bool> isSaveButtonEnable = false.obs;

  changeCheckBoxWithPersonalAgree(value) {
    boxStatusWithPersonalAgree.value = value;
  }

  changeCheckBoxWithAnonymous(value) {
    boxStatusWithAnonymous.value = value;
  }

  // Function ▼

  /// 텍스트 필드 OnChanged 핸들러
  ///
  /// [text] String: 텍스트 필드에 입력된 텍스트
  ///
  /// [type] String : 텍스트 필드 타입
  void handleOnChanged(
    String text, {
    required String type,
  }) {
    switch (type) {
      case 'title':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          titleError.value = '제목을 입력해주세요';
          return;
        }

        if (text.length < 2) {
          isSaveButtonEnable.value = false;
          titleError.value = '2자 이상 입력해주세요';
          return;
        }

        titleError.value = '';
        isSaveButtonEnable.value = true;
        break;
      case 'content':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          contentError.value = '내 증상 기록 내용을 입력해주세요';
          return;
        }

        if (text.length < 2) {
          isSaveButtonEnable.value = false;
          contentError.value = '2자 이상 입력해주세요';
          return;
        }

        contentError.value = '';
        isSaveButtonEnable.value = true;
        break;
    }

    // 저장 버튼 활성화 여부
    isSaveButtonEnable.value =
        titleError.value.isEmpty && contentError.value.isEmpty;
  }

  /// 데이터 수정하기 API
  Future<void> handleSubmit(BuildContext context) async {
    if (titleController.value.text.isEmpty) {
      titleError.value = '제목은 필수입니다.';
    } else {
      titleError.value = '';
    }

    if (contentController.value.text.isEmpty) {
      contentError.value = '내용은 필수입니다.';
    } else {
      contentError.value = '';
    }

    if (boxStatusWithPersonalAgree.isFalse) {
      Get.back();
      GlobalToastWidget('개인정보 처리방침에 동의해주세요.');
      return;
    }

    // if (boxStatusWithAnonymous.isFalse) {
    //   GlobalToastWidget('익명 전송에 체크해 주세요.');
    //   return;
    // }

    if (titleError.value.isNotEmpty || contentError.value.isNotEmpty) {
      return;
    }

    try {
      titleController.value.text = '';
      contentController.value.text = '';
      boxStatusWithPersonalAgree.value = false;
      boxStatusWithAnonymous.value = false;

      Get.back();

      await showAlertDialog(
        context,
        '의견 제안 발신 완료',
        '작성된 제안은 닥터 파킨슨 관리자에게 전송되어 향후 정책 결정의 자료로 사용됩니다.\r\n\r\n소중한 의견에 감사합니다.',
      );

      AuthBaseResponseModel response = await Provider.dio(
        method: 'POST',
        url: '/myinfo/policy',
        requestModel: {
          'title': titleController.value.text,
          'description': contentController.value.text,
        },
      );

      switch (response.statusCode) {
        case 201:
          // titleController.value.text = '';
          // contentController.value.text = '';
          // boxStatusWithPersonalAgree.value = false;
          // boxStatusWithAnonymous.value = false;
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

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
