// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dio/dio.dart' as Dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/main_provider.dart';

// write my symptoms controller
class WriteMySymptomsController extends GetxController {
  static WriteMySymptomsController get to => Get.find();

  // Data ▼ ============================================

  // EditController ▼ ========================================
  Rx<TextEditingController> mySymptomsTitleTextEditController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> mySymptomsContentTextEditController =
      TextEditingController(text: '').obs;

  // FocusNode ▼ ========================================
  Rx<FocusNode> titleFoucesNode = FocusNode().obs;
  Rx<FocusNode> contentFoucesNode = FocusNode().obs;

  Rx<String> titleError = ''.obs;
  Rx<String> contentError = ''.obs;

  // Function ▼ ========================================
  Future<void> handleSubmit() async {
    if (mySymptomsTitleTextEditController.value.text.isEmpty) {
      titleError.value = '제목은 필수입니다.';
    } else {
      titleError.value = '';
    }
    if (mySymptomsContentTextEditController.value.text.isEmpty) {
      contentError.value = '내용은 필수입니다.';
    } else {
      contentError.value = '';
    }

    if (titleError.value.isNotEmpty || contentError.value.isNotEmpty) {
      return;
    }

    try {
      Dio.FormData request = Dio.FormData.fromMap({
        'title': mySymptomsTitleTextEditController.value.text,
        'description': mySymptomsContentTextEditController.value.text,
        'files': [],
      });
      AuthBaseResponseModel response = await AuthProvider.dio(
          method: 'POST', url: '/myinfo/sympthom', requestModel: request);

      switch (response.statusCode) {
        case 201:
          mySymptomsTitleTextEditController.value.text = '';
          mySymptomsContentTextEditController.value.text = '';

          Get.back();
          GlobalToastWidget(message: '저장이 완료되었습니다.');

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
