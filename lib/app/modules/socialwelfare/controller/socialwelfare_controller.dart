// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/models/welfare_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/main_provider.dart';

class SocialWelfareController extends GetxController {
  static SocialWelfareController get to => Get.find();

  // Data ▼ ============================================
  late RxList<WelfareModel> welfareDatas;
  Rx<bool> process = true.obs;

  // Function ▼ ========================================
  /// * 사회복지제도 리스트 API
  Future<void> getWelfareList() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/home/welfare',
      );
      Logger().d(response.statusCode);
      switch (response.statusCode) {
        case 200:
          welfareDatas = List.generate(response.data.length,
              (index) => WelfareModel.fromJson(response.data[index])).obs;
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
    await getWelfareList();
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
