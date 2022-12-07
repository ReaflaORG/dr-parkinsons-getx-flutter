// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'package:base/app/global/global_toast_widget.dart';
import 'package:base/app/model/base_response_model.dart';
import 'package:base/app/provider/main_provider.dart';
import 'package:base/app/service/auth_service.dart';
import 'package:base/app/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../model/user_model.dart';

// profile setting controller
class ProfileSettingController extends GetxController {
  static ProfileSettingController get to => Get.find();

  // Data ▼ ============================================

  // EditController ▼ ========================================
  Rx<TextEditingController> userNameController =
      TextEditingController(text: AuthService.to.userData.value.userName ?? '')
          .obs;
  Rx<TextEditingController> userPhoneController = TextEditingController(
          text: AuthService.to.userData.value.userPhoneNumber ?? '')
      .obs;

  Rx<TextEditingController> guardianNameController = TextEditingController(
          text: AuthService.to.userData.value.guardianName ?? '')
      .obs;
  Rx<TextEditingController> guardianPhoneController = TextEditingController(
          text: AuthService.to.userData.value.guardianPhoneNumber ?? '')
      .obs;

  // FocusNode ▼ ========================================
  Rx<FocusNode> userNameFoucesNode = FocusNode().obs;
  Rx<FocusNode> userPhoneFoucesNode = FocusNode().obs;

  Rx<FocusNode> guardianNameFoucesNode = FocusNode().obs;
  Rx<FocusNode> guardianPhoneFoucesNode = FocusNode().obs;

  // Function ▼ ========================================
  // * 날짜 선택기
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

  // * 데이터 수정하기 API
  Future<void> handleSubmit() async {
    if (userNameController.value.text.isEmpty) {
      userNameError.value = '이름은 필수입니다.';
    } else {
      userNameError.value = '';
    }
    if (userPhoneController.value.text.isEmpty) {
      userPhoneError.value = '핸드폰 번호는 필수입니다.';
    } else {
      userPhoneError.value = '';
    }
    if (guardianNameController.value.text.isEmpty) {
      guardianNameError.value = '보호자 이름은 필수입니다.';
    } else {
      guardianNameError.value = '';
    }
    if (guardianPhoneController.value.text.isEmpty) {
      guardianPhoneError.value = '보호자 핸드폰 필수입니다.';
    } else {
      guardianPhoneError.value = '';
    }
    if (userNameError.value.isNotEmpty ||
        userPhoneError.value.isNotEmpty ||
        guardianNameError.value.isNotEmpty ||
        guardianPhoneError.value.isNotEmpty) {
      return;
    }

    try {
      Map<String, dynamic> request = {
        'user_name': userNameController.value.text,
        'user_phoneNumber': userPhoneController.value.text,
        'guardian_name': guardianNameController.value.text,
        'guardian_phoneNumber': guardianPhoneController.value.text,
        'user_gender': userGender.value,
        'user_birth_day': userBirthDay.value,
        'diagnostic_status': diagnosticStatus.value,
        'diagnostic_day': diagnosticDayString.value
      };
      AuthBaseResponseModel response = await AuthProvider.dio(
          method: 'PUT', url: '/myinfo', requestModel: request);
      switch (response.statusCode) {
        case 200:
          UserModel user = UserModel.fromJson(response.data['user']);
          AuthService.to.userData.value = user;
          AuthService.to.userData.refresh();
          Get.back();
          GlobalToastWidget(message: '프로필 수정이 완료되었습니다.');
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
  Rx<String> userGender = '남성'.obs;
  RxList<String> userGenderList = ['남성', '여성'].obs;

  Rx<String> diagnosticStatus = '의심'.obs;
  RxList<String> diagnosticStatusList = ['의심', '초기', '중증', '해당없음'].obs;

  Rx<String> userBirthDay = '30대'.obs;
  RxList<String> userBirthDayList = ['30대', '40대', '50대', '60대'].obs;

  Rx<DateTime> diagnosticDay = DateTime.now().obs;
  Rx<String> diagnosticDayString = Formmater.dateTimeFormat(DateTime.now()).obs;

  // * 에러 리스트
  Rx<String> userNameError = ''.obs;
  Rx<String> userPhoneError = ''.obs;
  Rx<String> guardianNameError = ''.obs;
  Rx<String> guardianPhoneError = ''.obs;

  @override
  Future<void> onInit() async {
    if (AuthService.to.userData.value.userGender != null) {
      userGender.value = AuthService.to.userData.value.userGender!;
    }

    if (AuthService.to.userData.value.diagnosticStatus != null) {
      diagnosticStatus.value = AuthService.to.userData.value.diagnosticStatus!;
    }

    if (AuthService.to.userData.value.userBirthDay != null) {
      userBirthDay.value = AuthService.to.userData.value.userBirthDay!;
    }

    if (AuthService.to.userData.value.diagnosticDay != null) {
      diagnosticDay.value = AuthService.to.userData.value.diagnosticDay!;
      diagnosticDayString.value = Formmater.dateTimeFormat(diagnosticDay.value);
    }

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
