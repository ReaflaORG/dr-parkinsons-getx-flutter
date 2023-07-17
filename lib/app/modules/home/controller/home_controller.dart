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

          if (homeData.value != null && homeData.value!.mission.isNotEmpty) {
            homeData.value!.mission.assignAll(homeData.value!.mission
                .where((element) => getDeffMinit(element.mission_time) >= 0)
                .toList());
            homeData.refresh();
          }

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
          if (homeData.value != null && homeData.value!.mission.isNotEmpty) {
            homeData.value!.mission.assignAll(homeData.value!.mission
                .where((element) => getDeffMinit(element.mission_time) >= 0)
                .toList());
            homeData.refresh();
          }

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
    int now = int.parse(DateFormat('HHmm').format(DateTime.now()));
    int now_m = int.parse(DateFormat('mm').format(DateTime.now()));

    int now_add = 0;

    int now_h = (now ~/ 100) + now_add;

    // Logger().d("시간 ${now_h}  : 분 :${now_m}");

    int time_h = time ~/ 100; // 시간
    int time_m = time % 100;

    if (time - now < 0) {
      return -1;
    }

    if (time_h - now_h <= 0) {
      return time_m - now_m;
    } else {
      return ((time_h - now_h) * 60) + (time_m - now_m);
    }
  }

  /// 미션 남은 시간 계산 (몇시간 몇분 남았는지)
  String getDeffMinit2(int time) {
    int now = int.parse(DateFormat('HHmm').format(DateTime.now()));
    int now_m = int.parse(DateFormat('mm').format(DateTime.now()));

    int now_add = 0;

    int now_h = (now ~/ 100) + now_add;

    int time_h = time ~/ 100; // 시간
    int time_m = time % 100;

    if (time - now < 0) {
      return '-1';
    }

    if (time_h - now_h <= 0) {
      int minuteDiff = time_m - now_m;
      if (minuteDiff >= 60) {
        int hour = minuteDiff ~/ 60;
        int minute = minuteDiff % 60;
        return formatTime(hour, minute);
      } else {
        return formatTime(0, minuteDiff);
      }
    } else {
      int hourDiff = time_h - now_h;
      int minuteDiff = time_m - now_m;

      if (minuteDiff < 0) {
        hourDiff -= 1;
        minuteDiff += 60;
      }

      return formatTime(hourDiff, minuteDiff);
    }
  }

  String formatTime(int hour, int minute) {
    String hourString = hour.toString();
    String minuteString = minute.toString();

    if (hour == 0) {
      return '$minuteString분';
    }

    return '$hourString시간 $minuteString분';
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
