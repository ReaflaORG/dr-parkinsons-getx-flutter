import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';
import '../../../theme/colors.dart';

class MissionController extends GetxController {
  static MissionController get to => Get.find();

  // Data ▼

  RxList<MissionModel> missionData = <MissionModel>[].obs;

  // Variable ▼

  Rx<bool> isLoad = true.obs;
  Rx<int> dateFormatInt = 0.obs;
  Rx<String> dateFormatString = '시간을 선택하세요'.obs;
  Rx<String> type = ''.obs;
  Rx<String> status = ''.obs;
  Rx<int> move = 0.obs;
  Rx<int> pill = 0.obs;
  Rx<int> clearMove = 0.obs;
  Rx<int> clearPill = 0.obs;
  List alarm = ['투약', '물마시기', '과일야채', '야외활동', '운동'];
  RxList<DateTime> dateList = <DateTime>[].obs;
  Rx<bool> boxStatus = false.obs;
  Rx<int> current_index = 0.obs;

  /// 미션 상태 (실패, 대기, 완료)
  RxBool isStatus = false.obs;

  // Function ▼

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
  void updateTime(int value, String data) {
    //인트화
    dateFormatInt.value = value;

    if (dateFormatInt >= 1200) {
      dateFormatString.value = '''오후 $data''';
      // DateFormat('오후 hh시 mm분').format(selectedTime.value);
      // } else if (dateFormatInt.value >= 1000 && dateFormatInt.value < 1200) {
      //   dateFormatString.value =
      //       '''오전 ${data}분''';
    } else {
      dateFormatString.value = '''오전 $data''';
      // dateFormatString = DateFormat('오전 hh시 mm분').format(selectedTime.value);
    }
  }

  Future<void> updateType(String data) async {
    type.value = data;
  }

  /// 미션 카운트 리셋
  void missionCountReset() {
    move.value = 0;
    clearMove.value = 0;
    pill.value = 0;
    clearPill.value = 0;
  }

  ///  오늘 미션 리스트 API
  Future<void> getMissionList() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url:
            '/mission/?select_date=${DateFormat('yyyy-MM-dd').format(dateList[current_index.value])}',
      );

      switch (response.statusCode) {
        case 200:
        case 201:
          missionData.clear();
          missionCountReset();
          for (int i = 0; i < response.data.length; i++) {
            missionData.add(MissionModel.fromJson(response.data[i]));
            if (missionData[i].mission_type.contains('운동')) {
              move.value++;
              if (missionData[i].clear) {
                clearMove.value++;
              }
            }
            if (missionData[i].mission_type.contains('투약')) {
              pill.value++;
              if (missionData[i].clear) {
                clearPill.value++;
              }
            }

            missionData[i].status = missionData[i].clear
                ? '완료'
                : missionData[i].mission_time <
                        int.parse(DateFormat('HHmm')
                            .format(DateTime.now())
                            .toString())
                    ? '실패'
                    : '대기';
          }

          missionData.refresh();
          isLoad.value = false;
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  ///  미션 추가 API
  Future<void> addMission() async {
    try {
      if (type.value == '') {
        throw Exception('미션 타입을 지정해주세요');
      }

      if (dateFormatString.value == '시간을 선택해주세요') {
        throw Exception(dateFormatString.value);
      }

      /// 5시 0분과 같이 0이 없는 경우 0을 추가해준다.
      // if (dateFormatInt.value.toString().length == 2) {
      //   dateFormatInt.value = int.parse('${dateFormatInt.value}0');
      // }

      AuthBaseResponseModel response = await Provider.dio(
        method: 'POST',
        url: '/mission',
        requestModel: {
          'mission_type': type.value,
          'mission_time': dateFormatInt.value, // 오후11시 00분
          'mission_time_string': dateFormatString.value,
        },
      );

      switch (response.statusCode) {
        case 200:
        case 201:
          getMissionList();
          Get.back();
          GlobalToastWidget(message: '미션이 추가되었습니다');
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString().substring(11));
    }
  }

  /// 날짜 리스트
  void handleDateInit() {
    String now_str = DateFormat('yyyy-MM-dd').format(DateTime.now());
    DateTime now = DateTime.parse(now_str);
    List<DateTime> date_list = [];
    for (int i = 0; i < 7; i++) {
      date_list.add(now.subtract(Duration(days: 6 - i)));
    }
    dateList.assignAll(date_list);
    current_index.value = dateList.length - 1;
    Logger().d(dateList);
  }

  ///  미션 수정 API
  Future<void> updateMission({
    required int mission_id,
  }) async {
    try {
      /// 5시 0분과 같이 0이 없는 경우 0을 추가해준다.
      if (dateFormatInt.value.toString().length == 2) {
        dateFormatInt.value = int.parse('${dateFormatInt.value}0');
      }

      AuthBaseResponseModel response = await Provider.dio(
        method: 'PUT',
        url: '/mission/$mission_id',
        requestModel: {
          'mission_type': type.value,
          'mission_time': dateFormatInt.value, // 오후11시 00분
          'mission_time_string': dateFormatString.value,
        },
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

  /// 미션 삭제 API
  Future<void> deleteMission({
    required int mission_id,
  }) async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'DELETE',
        url: '/mission/$mission_id',
      );

      Logger().d(response.data);
      switch (response.statusCode) {
        case 200:
        case 201:
          getMissionList();
          // Get.back();
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

  /// 미션 클리어 API
  Future<void> clearMission({
    required int mission_id,
    required int index,
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

  @override
  Future<void> onInit() async {
    handleDateInit();
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
