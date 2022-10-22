// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../service/global_service.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  // Funcion ▼ ========================================

  /// 페이지 이동
  void handleGetTo({required bool status}) => Future.delayed(
        const Duration(milliseconds: 1000),
        () => status == true
            ? Get.offAndToNamed('/main')
            : Get.offAndToNamed('/signin'),
      );

  /// 컨트롤러 초기화
  Future<void> handleInitialization() async {
    // 권한(이용) 안내 (전화 + 저장 + 주소록)
    if (GetStorage().read('initialize_permission') == null ||
        GetStorage().read('initialize_permission') == false) {
      // Future.delayed(const Duration(milliseconds: 3000),
      //     () => Get.offAndToNamed("/permission"));
    } else {
      handleGetTo(status: false);
    }
  }

  @override
  Future<void> onInit() async {
    /// 컨트롤러 초기화
    await handleInitialization();

    super.onInit();
  }

  @override
  void onReady() {
    /// 디바이스 사이즈 체크
    GlobalService.to.handleScreenSize();

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
