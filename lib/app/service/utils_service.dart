import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wakelock/wakelock.dart';

/// 유틸 서비스
class UtilsService extends GetxService {
  static UtilsService get to => Get.find();

  // 회전 체크
  Rx<bool> isLandscape = false.obs;

  /// 세로 모드로 설정하는 함수입니다.
  ///
  /// isLandscape 값이 현재와 반대로 바뀌고, SystemChrome과 Wakelock을 이용하여
  ///
  /// 기기 방향을 landscapeLeft와 landscapeRight로 고정하고, 화면이 꺼지지 않도록 합니다.
  Future handleLandScap() async {
    Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]),
      Wakelock.enable(),
    ]);
  }

  /// 세로 모드로 설정하는 함수입니다.
  ///
  /// isLandscape 값이 현재와 반대로 바뀌고, SystemChrome과 Wakelock을 이용하여
  ///
  /// 기기 방향을 portraitUp로 고정하고, 화면이 꺼지도록 합니다.
  Future handlePortrait() async {
    Future.wait([
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]),
      Wakelock.disable(),
    ]);
  }

  /// 상태 표시줄과 소프트웨어 키보드를 보이게 하는 함수입니다.
  Future handleShowSystemUI() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  /// 상태 표시줄과 소프트웨어 키보드를 감추는 함수입니다.
  Future handleHideSystemUI() async {
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }

  @override
  void onInit() {
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
}
