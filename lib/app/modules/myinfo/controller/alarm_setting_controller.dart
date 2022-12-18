// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/globals/global_toast_widget.dart';
import 'package:base/app/models/base_response_model.dart';
import 'package:base/app/models/user_model.dart';
import 'package:base/app/service/auth_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../provider/main_provider.dart';

// alarm setting controller
class AlarmSettingController extends GetxController {
  static AlarmSettingController get to => Get.find();

  // Data ▼ ============================================
  // alarm setting item model

  // Function ▼ ========================================

  // Variable ▼ ========================================

  Future<void> checkBasicAlarm({required String type}) async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'PUT',
        url: '/myinfo/setting/${type}',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          UserModel userData = UserModel.fromJson(response.data['user']);
          AuthService.to.userData.value = userData;
          AuthService.to.userData.refresh();
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
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
