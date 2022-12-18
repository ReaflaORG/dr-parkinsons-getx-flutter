// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:base/app/globals/global_toast_widget.dart';
import 'package:base/app/models/base_response_model.dart';
import 'package:base/app/models/home_model.dart';
import 'package:base/app/provider/main_provider.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  // Data ▼ ============================================
  late Rx<HomeModel> homeData;
  Rx<bool> process = true.obs;
  Rx<bool> alert = true.obs;
  // Function ▼ ========================================
  /// * 홈 정보 받아오기 API
  Future<void> getHomeData() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/home',
      );

      Logger().d(response.data);

      switch (response.statusCode) {
        case 200:
          homeData = HomeModel.fromJson(response.data).obs;
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

  /// * 홈 정보 업데이트 API
  Future<void> getUpdateHomeData() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/home',
      );

      Logger().d(response.data);

      switch (response.statusCode) {
        case 200:
          homeData.value = HomeModel.fromJson(response.data);
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

  /// 미션 클리어 API
  Future<void> clearMission({
    required int mission_id,
  }) async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'PATCH',
        url: '/mission/$mission_id',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
        case 201:
          await getUpdateHomeData();
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  /// * 보호자에게 응급 메세지 보내기 API
  Future<void> sendEmergency() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'POST',
        url: '/home/message',
      );
      //api 보내는거 에러뜸. 403
      Logger().d(response.statusCode);
      switch (response.statusCode) {
        case 201:
          break;

        default:
          alert.value = false;
          throw Exception(response.message);
      }
    } catch (e) {
      alert.value = false;
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  // Variable ▼ ========================================

  @override
  Future<void> onInit() async {
    await getHomeData();
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
