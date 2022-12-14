// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/service/auth_service.dart';
import 'package:dr_parkinsons/app/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../models/birth_day_model.dart';
import '../../../models/user_model.dart';
import '../../../provider/provider.dart';

// profile setting controller
class ProfileSettingController extends GetxController {
  static ProfileSettingController get to => Get.find();

  // Data ▼

  // FocusNode ▼

  /// 사용자 이름 포커스 노드
  Rx<FocusNode> userNameFoucesNode = FocusNode().obs;

  /// 사용자 핸드폰 번호 포커스 노드
  Rx<FocusNode> userPhoneFoucesNode = FocusNode().obs;

  /// 보호자 이름 포커스 노드
  Rx<FocusNode> guardianNameFoucesNode = FocusNode().obs;

  /// 보호자 핸드폰 번호 포커스 노드
  Rx<FocusNode> guardianPhoneFoucesNode = FocusNode().obs;

  // Controller ▼

  /// 사용자 이름
  Rx<TextEditingController> userNameController =
      TextEditingController(text: AuthService.to.userData.value.userName ?? '')
          .obs;

  /// 사용자 이름
  Rx<TextEditingController> userPhoneController = TextEditingController(
          text: AuthService.to.userData.value.userPhoneNumber ?? '')
      .obs;

  /// 보호자 이름
  Rx<TextEditingController> guardianNameController = TextEditingController(
          text: AuthService.to.userData.value.guardianName ?? '')
      .obs;

  /// 보호자 핸드폰 번호
  Rx<TextEditingController> guardianPhoneController = TextEditingController(
          text: AuthService.to.userData.value.guardianPhoneNumber ?? '')
      .obs;

  // Variable ▼

  /// 이름
  Rx<String> userGender = '남성'.obs;

  /// 성별 리스트
  RxList<String> userGenderList = ['남성', '여성'].obs;

  /// 진단 상태
  Rx<String> diagnosticStatus = '의심'.obs;

  /// 진단 상태 리스트
  RxList<String> diagnosticStatusList = ['의심', '초기', '중증', '해당없음'].obs;

  /// 나이대 리스트
  RxList<BirthDayModel> userBirthDayList = [
    BirthDayModel(
      label: '40대 이하',
      birthday: 40,
      isSelected: false,
    ),
    BirthDayModel(
      label: '50대',
      birthday: 50,
      isSelected: false,
    ),
    BirthDayModel(
      label: '60대',
      birthday: 60,
      isSelected: false,
    ),
    BirthDayModel(
      label: '70대',
      birthday: 70,
      isSelected: false,
    ),
    BirthDayModel(
      label: '80대 이상',
      birthday: 81,
      isSelected: false,
    ),
  ].obs;

  /// 저장 버튼 활성화 여부
  Rx<bool> isSaveButtonEnable = false.obs;

  /// 이름 오류 메세지
  Rx<String> userNameError = ''.obs;

  /// 핸드폰 번호 오류 메세지
  Rx<String> userPhoneError = ''.obs;

  /// 보호자 이름 오류 메세지
  Rx<String> guardianNameError = ''.obs;

  /// 보호자 핸드폰 번호 오류 메세지
  Rx<String> guardianPhoneError = ''.obs;

  /// 파킨슨 의심시기 (DateTime)
  Rx<DateTime> diagnosticDay = DateTime.now().obs;

  /// 파킨슨 의심시기 (String)
  Rx<String> diagnosticDayString = Formmater.dateTimeFormat(DateTime.now()).obs;

  // Function ▼

  /// 텍스트 필드 OnChanged 핸들러
  ///
  /// [text] String: 텍스트 필드에 입력된 텍스트
  ///
  /// [type] String : 텍스트 필드 타입
  void handleOnChanged(
    String text, {
    required String type,
  }) {
    switch (type) {
      case 'userName':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          userNameError.value = '본인의 이름을 입력해주세요';
          return;
        }

        if (text.length < 3) {
          isSaveButtonEnable.value = false;
          userNameError.value = '본인의 이름을 입력해주세요';
          return;
        }

        userNameError.value = '';
        isSaveButtonEnable.value = true;
        break;
      case 'userPhone':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          userPhoneError.value = '본인의 연락처를 입력해주세요';
          return;
        }

        if (text.length < 10) {
          isSaveButtonEnable.value = false;
          userPhoneError.value = "'-'를 제외한 11자리를 입력해주세요";
          return;
        }

        userPhoneError.value = '';
        isSaveButtonEnable.value = true;
        break;
      case 'guardianName':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          guardianNameError.value = '보호자 이름을 입력해주세요';
          return;
        }

        if (text.length < 3) {
          isSaveButtonEnable.value = false;
          guardianNameError.value = '보호자 이름을 입력해주세요';
          return;
        }

        guardianNameError.value = '';
        isSaveButtonEnable.value = true;
        break;
      case 'guardianPhone':
        if (text.isEmpty) {
          isSaveButtonEnable.value = false;
          guardianPhoneError.value = '보호자 연락처를 입력해주세요';
          return;
        }

        if (text.length < 10) {
          isSaveButtonEnable.value = false;
          guardianPhoneError.value = "'-'를 제외한 11자리를 입력해주세요";
          return;
        }

        guardianPhoneError.value = '';
        isSaveButtonEnable.value = true;
        break;
    }

    // 저장 버튼 활성화 여부
    isSaveButtonEnable.value =
        userNameError.value.isEmpty && userPhoneError.value.isEmpty;
  }

  /// 날짜 선택
  void handleSelectDate() {
    Get.dialog(
      Dialog(
        child: Container(
          color: Colors.white,
          width: 320.w,
          padding: EdgeInsets.all(10.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SfDateRangePicker(
                confirmText: '선택',
                cancelText: '닫기',
                showActionButtons: true,
                onCancel: () => Get.back(),
                onSubmit: (data) {
                  diagnosticDay.value = data as DateTime;
                  diagnosticDayString.value =
                      Formmater.dateTimeFormat(diagnosticDay.value);
                  Get.back();
                },
                selectionMode: DateRangePickerSelectionMode.single,
                initialSelectedDate: diagnosticDay.value,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// 라디오 선택 핸들러
  ///
  /// [index] int : 선택된 라디오 인덱스
  ///
  /// [type] String : 라디오 타입
  void handleRadioSelect(
    int index, {
    required String type,
  }) {
    switch (type) {
      case '성별':
        userGender.value = userGenderList[index];
        break;
      case '연령대':
        for (var element in userBirthDayList) {
          if (element.birthday == userBirthDayList[index].birthday) {
            element.isSelected = true;
          } else {
            element.isSelected = false;
          }
        }
        userBirthDayList.refresh();
        break;
      case '파킨슨 진단 결과':
        diagnosticStatus.value = diagnosticStatusList[index];
        break;
    }
  }

  /// 데이터 수정하기 프로바이더
  Future<void> handlePutMyInfoProvider() async {
    try {
      await Provider.dio(
        method: 'PUT',
        url: '/myinfo',
        requestModel: {
          'user_name': userNameController.value.text,
          'user_phoneNumber': userPhoneController.value.text,
          'guardian_name': guardianNameController.value.text,
          'guardian_phoneNumber': guardianPhoneController.value.text,
          'user_gender': userGender.value,
          'user_birth_day':
              '${userBirthDayList.firstWhere((element) => element.isSelected).birthday}',
          'diagnostic_status': diagnosticStatus.value,
          'diagnostic_day': diagnosticDayString.value
        },
      ).then((response) {
        switch (response.statusCode) {
          case 200:
            AuthService.to.userData.value =
                UserModel.fromJson(response.data['user']);
            AuthService.to.userData.refresh();
            GlobalToastWidget('프로필 수정이 완료되었습니다.');
            break;
          default:
            throw Exception(response.message);
        }
      });
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 초기화
  Future<void> Initialize() async {
    if (AuthService.to.userData.value.userGender != null) {
      userGender.value = AuthService.to.userData.value.userGender!;
    }

    if (AuthService.to.userData.value.diagnosticStatus != null) {
      diagnosticStatus.value = AuthService.to.userData.value.diagnosticStatus!;
    }

    if (AuthService.to.userData.value.userBirthDay != null) {
      // 연령대 초기화
      for (var element in userBirthDayList) {
        if (element.birthday ==
            int.parse(AuthService.to.userData.value.userBirthDay!)) {
          element.isSelected = true;
        } else {
          element.isSelected = false;
        }
      }
      userBirthDayList.refresh();
    }

    if (AuthService.to.userData.value.diagnosticDay != null) {
      diagnosticDay.value = AuthService.to.userData.value.diagnosticDay!;
      diagnosticDayString.value = Formmater.dateTimeFormat(diagnosticDay.value);
    }
  }

  @override
  Future<void> onInit() async {
    await Initialize();

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
