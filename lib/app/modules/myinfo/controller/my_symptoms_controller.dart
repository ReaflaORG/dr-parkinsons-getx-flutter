// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';
import '../models/my_symptoms_item_model.dart';

// my symptoms controller
class MySymptomsController extends GetxController {
  static MySymptomsController get to => Get.find();

  // Data ▼
  RxList<MySymptomsModel> listArray = <MySymptomsModel>[].obs;
  Rx<bool> process = true.obs;

  // Function ▼
  Future<void> getMySymptomsData() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/myinfo/sympthom',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          listArray.assignAll(List.generate(response.data.length,
              (index) => MySymptomsModel.fromJson(response.data[index])));
          listArray.refresh();
          process.value = false;
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  Future<void> deleteMySymptomsData(int symptomId) async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'DELETE',
        url: '/myinfo/sympthom/$symptomId',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          process.value = false;
          await getMySymptomsData();
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
