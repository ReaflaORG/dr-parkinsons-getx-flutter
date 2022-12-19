// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/globals/global_toast_widget.dart';
import 'package:base/app/models/parkinson_post_model.dart';
import 'package:base/app/provider/main_provider.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../models/base_response_model.dart';

class FactPostController extends GetxController {
  static FactPostController get to => Get.find();

  // Data ▼ ============================================
  Rx<bool> process = true.obs;
  Rx<dynamic> parkinson_post_id = 1.obs;
  late Rx<ParkinsonPostModel> postData;
  // Function ▼ ========================================
  /// * 완전 정복 상세보기 API
  Future<void> getFactDetail() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/home/parkinson/$parkinson_post_id',
      );
      Logger().d(response.statusCode);
      switch (response.statusCode) {
        case 200:
          postData = ParkinsonPostModel.fromJson(response.data).obs;
          process.value = false;
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
    parkinson_post_id.value = await Get.arguments['id'];
    await getFactDetail();
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
