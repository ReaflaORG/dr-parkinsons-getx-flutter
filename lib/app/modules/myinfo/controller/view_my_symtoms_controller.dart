// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';
import '../models/my_symptoms_item_model.dart';

// view my symptoms controller
class ViewMySymptomsController extends GetxController {
  static ViewMySymptomsController get to => Get.find();

  // Data ▼ ============================================
  late Rx<MySymptomsModel> item;
  Rx<bool> isLoad = true.obs;
  Rx<int> symptomId = 1.obs;

  // Function ▼ ========================================
  Future<void> getMySymptomsData() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/myinfo/sympthom/${symptomId.value}',
      );

      switch (response.statusCode) {
        case 200:
          if (isLoad.value) {
            item = MySymptomsModel.fromJson(response.data).obs;
          } else {
            item.value = MySymptomsModel.fromJson(response.data);
          }
          isLoad.value = false;
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
    }
  }
  // Variable ▼ ========================================

  @override
  Future<void> onInit() async {
    symptomId.value = Get.arguments['id'];
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
