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
  RxList<MissionModel> missionData = <MissionModel>[].obs;
  Rx<bool> process = true.obs;
  Rx<int> dateFormatInt = 0.obs;
  Rx<String> dateFormatString = '시간을 선택하세요'.obs;
  Rx<String> type = ''.obs;
  Rx<String> status = ''.obs;

  List alarm = ['투약', '물마시기', '과일야채', '야외활동', '운동'];
  Rx<bool> boxStatus = false.obs;
  // Rx<Icon> box = const Icon(Icons.check_box_outline_blank_rounded).obs;
  // Function ▼ ========================================

  Color handleColorBoxDecoration({
    String? type = 'background_color',
    required int index,
  }) {
    if (type == 'card_color') {
      return missionData[index].status == '대기'
          ? ColorPath.PrimaryLightColor
          : missionData[index].status == '실패'
              ? ColorPath.TertiaryLightColor
              : ColorPath.Background2HD9D9D9;
    }

    return missionData[index].status == '대기'
        ? ColorPath.BackgroundWhite
        : missionData[index].status == '실패'
            ? ColorPath.TertiaryLightColor.withOpacity(0.4)
            : ColorPath.Background2HD9D9D9.withOpacity(0.7);
  }

  /// 시간 업데이트 함수
  void updateTime(String data) {
    Logger().d(data);
    dateFormatInt.value = int.parse(data); //인트화
    if (dateFormatInt >= 1200) {
      dateFormatString.value =
          '''오후 ${int.parse(data.substring(0, 2)) - 12}시 ${data.substring(2, 4)}분''';
      // DateFormat('오후 hh시 mm분').format(selectedTime.value);
    } else if (dateFormatInt.value >= 1000 && dateFormatInt.value < 1200) {
      dateFormatString.value =
          '''오전 ${data.substring(0, 2)}시 ${data.substring(2, 4)}분''';
    } else {
      dateFormatString.value =
          '''오전 0${data.substring(0, 1)}시 ${data.substring(1, 3)}분''';
      // dateFormatString = DateFormat('오전 hh시 mm분').format(selectedTime.value);
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
        url:
            '/mission/?select_date=${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
      );

      Logger().d(response.statusCode);
      switch (response.statusCode) {
        case 200:
        case 201:
          missionData.clear();
          for (int i = 0; i < response.data.length; i++) {
            missionData.add(MissionModel.fromJson(response.data[i]));
            missionData[i].status = missionData[i].clear
                ? '완료'
                : missionData[i].mission_time <
                        int.parse(DateFormat('HHmm')
                            .format(DateTime.now())
                            .toString())
                    ? '실패'
                    : '대기';
          }

          process.value = false;
          missionData.refresh();
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
      Map<String, dynamic> request = {
        'mission_type': type.value,
        'mission_time': dateFormatInt.value, //오후11시 00분
        'mission_time_string': dateFormatString.value,
      };

      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'POST',
        url: '/mission',
        requestModel: request,
      );

      switch (response.statusCode) {
        case 200:
        case 201:
          getMissionList();
          Get.back();
          GlobalToastWidget(message: '추가 되었습니다.');
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
  Future<void> updateMission({
    required int mission_id,
  }) async {
    try {
      Map<String, dynamic> request = {
        'mission_type': type.value,
        'mission_time': dateFormatInt.value, //오후11시 00분
        'mission_time_string': dateFormatString.value,
      };

      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'PUT',
        url: '/mission/$mission_id',
        requestModel: request,
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
        case 201:
          getMissionList();
          Get.back();
          GlobalToastWidget(message: '수정 되었습니다.');
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
  Future<void> deleteMission({
    required int mission_id,
  }) async {
    try {
      AuthBaseResponseModel response = await AuthProvider.dio(
        method: 'DELETE',
        url: '/mission/$mission_id',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
        case 201:
          getMissionList();
          Get.back();
          GlobalToastWidget(message: '삭제 되었습니다.');
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
  Future<void> clearMission({
    required int mission_id,
    required int index,
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
          getMissionList();
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
  Rx<int> allSportsCount = 10.obs;
  Rx<int> finSportsCount = 8.obs;
  Rx<int> allInjectCount = 10.obs;
  Rx<int> finInjectCount = 9.obs;

  final data = 2;
  @override
  Future<void> onInit() async {
    await getMissionList();
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
