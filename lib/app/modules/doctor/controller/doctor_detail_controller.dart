import 'dart:async';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/doctor_model.dart';
import '../../../provider/provider.dart';
import '../../../service/auth_service.dart';

/// 주치의 찾기 컨트롤러
class DoctorDetailController extends GetxController {
  static DoctorDetailController get to => Get.find();

  // Data ▼

  /// 의사 데이터
  Rx<DoctorModel> doctor = DoctorModel().obs;

  // Data ▼

  /// 로딩 상태
  Rx<bool> isLoad = true.obs;

  /// 의사 이이디
  dynamic doctor_id = Get.arguments['doctor_id'] ?? 1;

  /// 전문의 설정 여부
  Rx<bool> isDoctorSubscribe = false.obs;

  // 유튜브 플레이어 컨트롤러
  YoutubePlayerController? youtubeController;

  // 유튜브 전체 화면 여부
  Rx<bool> isPlaying = false.obs;

  // Function ▼

  /// 전문의 데이터 불러오기
  Future<void> handleDoctorDetailProvider() async {
    try {
      isLoad.value = true;

      await Provider.dio(
        method: 'GET',
        url: '/doctor/$doctor_id',
      ).then((response) {
        switch (response.statusCode) {
          case 200:
            AuthService.to.handleMyInfo();
            doctor.value = DoctorModel.fromJson(response.data);
            handleDoctorSubscribe();
            isLoad.value = false;
            break;
          default:
            throw Exception(response.message);
        }
      });
    } catch (e) {
      isLoad.value = false;
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    }
  }

  /// 전문의 설정하기 불러오기
  Future<void> handleDoctorPatchProvider() async {
    try {
      await Provider.dio(
        method: 'PATCH',
        url: '/doctor/$doctor_id',
      ).then((response) async {
        switch (response.statusCode) {
          case 200:
            Logger().d(response.data);
            AuthService.to.handleMyInfo();
            doctor.value = DoctorModel.fromJson(response.data);
            doctor.refresh();
            handleDoctorSubscribe();
            if (!isDoctorSubscribe.value) {
              GlobalToastWidget('내 주치의 설정이 완료되었습니다');
            }
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

  /// 전문의 설정
  void handleDoctorSubscribe() {
    doctor.value.users!
                .indexWhere((e) => e == AuthService.to.userData.value.uid) !=
            -1
        ? isDoctorSubscribe.value = false
        : isDoctorSubscribe.value = true;
  }

  @override
  Future<void> onInit() async {
    await handleDoctorDetailProvider().then((value) {
      isLoad.value = false;
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // 유튜브 플레이어 컨트롤러가 존재할 경우 종료
    if (youtubeController != null) {
      youtubeController!.dispose();
    }

    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
