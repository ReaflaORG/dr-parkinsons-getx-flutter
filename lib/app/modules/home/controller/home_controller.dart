// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/base_response_model.dart';
import 'package:dr_parkinsons/app/models/home_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../provider/provider.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  // Data ▼

  Rx<HomeModel?> homeData = (null as HomeModel?).obs;

  // Variable ▼

  /// 로딩 상태
  Rx<bool> isLoad = true.obs;

  /// 응급 메세지 보내기 버튼 눌렀는지
  Rx<bool> alert = true.obs;

  // Function ▼

  /// 홈 정보 받아오기 API
  Future<void> getHomeData() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/home',
      );

      switch (response.statusCode) {
        case 200:
          homeData = HomeModel.fromJson(response.data).obs;
          isLoad.value = false;
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 홈 정보 업데이트 API
  Future<void> getUpdateHomeData() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/home',
      );

      Logger().d(response.data);

      switch (response.statusCode) {
        case 200:
          homeData.value = HomeModel.fromJson(response.data);
          isLoad.value = false;
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 미션 클리어 API
  Future<void> clearMission({
    required int mission_id,
  }) async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
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
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 보호자에게 응급 메세지 보내기 API
  Future<void> sendEmergency() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'POST',
        url: '/home/message',
      );

      // api 보내는거 에러뜸. 403
      Logger().d(response.statusCode);
      switch (response.statusCode) {
        case 201:
          break;
        default:
          alert.value = false;
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      alert.value = false;
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 미션 남은 시간 계산
  int getDeffMinit(int time) {
    Logger().d(time);

    String now = DateFormat('HH:mm').format(DateTime.now());
    return time - int.parse(now.replaceAll(':', ''));
  }

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
