// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/modules/myinfo/controller/my_symptoms_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart' as Dio;

import '../../../global/global_toast_widget.dart';
import '../../../model/base_response_model.dart';
import '../../../model/my_symptoms_model.dart';
import '../../../provider/main_provider.dart';

// edity my symptoms controller
class EditMySymptomsController extends GetxController {
  static EditMySymptomsController get to => Get.find();

  // Data ▼ ============================================

  // EditController ▼ ========================================
  late Rx<TextEditingController> titleController;
  late Rx<TextEditingController> contentController;

  // FocusNode ▼ ========================================
  Rx<FocusNode> titleFoucesNode = FocusNode().obs;
  Rx<FocusNode> contentFoucesNode = FocusNode().obs;

  // * 에러 리스트
  Rx<String> titleError = ''.obs;
  Rx<String> contentError = ''.obs;

  // Variable ▼ ============================================
  late Rx<MySymptomsModel> editItem;
  Rx<bool> process = true.obs;
  Rx<dynamic> symptomId = 1.obs;

  // Function ▼ ========================================
  Future<void> getMySymptomsData() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/myinfo/sympthom/$symptomId',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          editItem = MySymptomsModel.fromJson(response.data).obs;
          process.value = false;

          titleController =
              TextEditingController(text: editItem.value.title).obs;
          contentController =
              TextEditingController(text: editItem.value.description).obs;

          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

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

    if (titleError.value.isNotEmpty || contentError.value.isNotEmpty) {
      return;
    }

    try {
      Dio.FormData request = Dio.FormData.fromMap({
        'title': titleController.value.text,
        'description': contentController.value.text,
        'files': [],
        'remove_symptom_history_files': null,
      });

      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'PUT',
        url: '/myinfo/sympthom/$symptomId',
        requestModel: request,
      );
      switch (response.statusCode) {
        case 200:
          titleController.value.text = '';
          contentController.value.text = '';

          MySymptomsController.to.getMySymptomsData();

          Get.back();
          await GlobalToastWidget(message: '수정되었습니다.');

          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }
  // Function ▼ ========================================

  @override
  Future<void> onInit() async {
    symptomId.value = await Get.arguments['id'];
    await getMySymptomsData();
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
