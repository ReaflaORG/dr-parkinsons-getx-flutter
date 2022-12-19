// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:base/app/model/my_symptoms_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../global/global_toast_widget.dart';
import '../../../model/base_response_model.dart';
import '../../../provider/main_provider.dart';

// my symptoms controller
class MySymptomsController extends GetxController {
  static MySymptomsController get to => Get.find();

  // Data ▼ ============================================
  RxList<MySymptomsModel> listArray = <MySymptomsModel>[].obs;
  Rx<bool> process = true.obs;

  // Function ▼ ========================================
  Future<void> getMySymptomsData() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/myinfo/sympthom',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          listArray.assignAll(List.generate(response.data.length,
              (index) => MySymptomsModel.fromJson(response.data[index])));
          process.value = false;
          //listArray.map((element) => Logger().d(element.toJson()));
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  Future<void> deleteMySymptomsData(int symptomId) async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'DELETE',
        url: '/myinfo/sympthom/$symptomId',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          process.value = false;
          //listArray.map((element) => Logger().d(element.toJson()));
          await getMySymptomsData();
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
