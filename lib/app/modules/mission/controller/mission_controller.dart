import 'dart:async';
import 'package:base/app/global/global_toast_widget.dart';
import 'package:base/app/model/mission_model.dart';
import 'package:base/app/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../model/base_response_model.dart';
import '../../../theme/colors.dart';

class MissionController extends GetxController {
  static MissionController get to => Get.find();

  // Data ▼ ============================================
  late Rx<MissionModel> missionData;
  Rx<DateTime> time = DateTime.now().obs;
  Rx<String> type = ''.obs;
  List alarm = ['투약', '물마시기', '과일야채', '야외활동', '운동'];
  // Function ▼ ========================================
  changeCheckBox() {
    boxStatus.value = !boxStatus.value;
    if (boxStatus.value) {
      box.value = const Icon(Icons.check_box_outline_blank_rounded);
    } else {
      box.value = const Icon(Icons.check_box_outlined);
    }
  }

  Future<void> updateType(String data) async {
    type.value = data;
  }

  /// * 오늘 미션 리스트 API
  Future<void> getMissionList() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'GET',
        url: '/mission',
      );

      switch (response.statusCode) {
        case 200:
          missionData = MissionModel.fromJson(response.data).obs;

          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  /// * 미션 추가 API
  Future<void> addMission() async {
    try {
      int dateFormatInt = int.parse(DateFormat('hhmm').format(time.value));
      String dateFormatString = '';
      if (dateFormatInt >= 1200) {
        dateFormatString = DateFormat('오후 hh시 mm분').format(time.value);
      } else {
        dateFormatString = DateFormat('오전 hh시 mm분').format(time.value);
      }
      Map<String, dynamic> request = {
        'mission_type': '운동',
        'mission_time': dateFormatInt, //오후11시 00분
        'mission_time_string': dateFormatString,
      };
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'POST',
        url: '/mission',
        requestModel: request,
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  /// * 미션 수정 API
  Future<void> updateMission() async {
    try {
      Map<String, dynamic> request = {
        'mission_type': '2022-10-24',
        'mission_time': 1,
        'mission_time_string': '',
      };
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'PUT',
        url: '/mission/',
        requestModel: request,
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  /// * 미션 삭제 API
  Future<void> deleteMission() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'DELETE',
        url: '/mission',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
          break;

        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  /// * 미션 클리어 API
  Future<void> clearMission() async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'PATCH',
        url: '/mission',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
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
  Rx<int> missionCount = 4.obs;
  Rx<int> allSportsCount = 10.obs;
  Rx<int> finSportsCount = 8.obs;
  Rx<int> allInjectCount = 10.obs;
  Rx<int> finInjectCount = 9.obs;
  Rx<bool> boxStatus = true.obs;
  Rx<Icon> box = const Icon(Icons.check_box_outline_blank_rounded).obs;
  final data = 2;
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
