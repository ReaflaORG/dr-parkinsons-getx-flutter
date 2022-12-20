// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/models/doctor_model.dart';
import 'package:dr_parkinsons/app/service/auth_service.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';

/// 주치의 찾기 컨트롤러
class DoctorController extends GetxController {
  static DoctorController get to => Get.find();

  // Data ▼ ============================================
  // 의사 이이디
  Rx<int> doctor_id = 0.obs;
  // doctor item model
  late Rx<DoctorModel> doctor;
  Rx<bool> process = true.obs;

  // Function ▼ ========================================

  // 전문의 설정

  // 전문의 데이터 불러오기
  Future<void> getDoctorDetail() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/doctor/$doctor_id',
      );

      switch (response.statusCode) {
        case 200:
          DoctorModel item = DoctorModel.fromJson(response.data);
          if (process.value) {
            doctor = item.obs;
          } else {
            doctor.value = item;
          }
          process.value = false;
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString());
    }
  }

  // 전문의 설정하기 불러오기
  Future<void> putDoctorUser() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'PATCH',
        url: '/doctor/$doctor_id',
      );

      Logger().d(response.statusCode);
      switch (response.statusCode) {
        case 200:
          await getDoctorDetail();
          await AuthService.to.handleMyInfo();
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString());
    }
  }

  // Variable ▼ ========================================

  @override
  Future<void> onInit() async {
    doctor_id.value = Get.arguments['doctor_id'] ?? 1;
    await getDoctorDetail();
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
