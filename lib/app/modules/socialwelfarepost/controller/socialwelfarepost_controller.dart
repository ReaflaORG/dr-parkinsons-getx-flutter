// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/model/welfare_model.dart';
import 'package:base/app/provider/main_provider.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../global/global_toast_widget.dart';
import '../../../model/base_response_model.dart';

class SocialWelfarePostController extends GetxController {
  static SocialWelfarePostController get to => Get.find();

  // Data ▼ ============================================
  Rx<bool> process = true.obs;
  Rx<dynamic> welfare_post_id = 1.obs;
  late Rx<WelfareModel> postData;
  // Function ▼ ========================================
  /// * 사회복지제도 상세보기 API
  Future<void> getWelfareDetail() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/home/welfare/$welfare_post_id',
      );

      switch (response.statusCode) {
        case 200:
          postData = WelfareModel.fromJson(response.data).obs;
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
    welfare_post_id.value = await Get.arguments['id'];
    await getWelfareDetail();
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
