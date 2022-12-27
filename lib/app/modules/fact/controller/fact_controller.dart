// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/parkinson_post_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';

class FactController extends GetxController {
  static FactController get to => Get.find();

  // Data ▼ ============================================
  late RxList<ParkinsonPostModel> factDatas;
  Rx<bool> process = true.obs;
  // Variable ▼ ========================================

  // Function ▼ ========================================
  /// * 완전정복 리스트 API
  Future<void> getFactList() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/home/parkinson',
      );

      switch (response.statusCode) {
        case 200:
          factDatas = List.generate(response.data.length,
              (index) => ParkinsonPostModel.fromJson(response.data[index])).obs;
          process.value = false;
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString());
    }
  }

  @override
  Future<void> onInit() async {
    await getFactList();

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
