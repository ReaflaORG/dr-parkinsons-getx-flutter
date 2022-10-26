// ignore_for_file: unnecessary_overrides, cast_nullable_to_non_nullable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../utils/app_version_check.dart';

class GlobalService extends GetxService {
  static GlobalService get to => Get.find();

  // Funcion ▼ ========================================

  /// 디바이스 스크린 사이즈 체크
  Future<void> handleScreenSize() async {
    final Rx<BuildContext?> context = Get.context.obs;

    Logger().d('''
[SCREEN_SIZE] 스크린 사이즈
displaySize : ${MediaQuery.of(context.value!).size}
window.physicalSize : ${window.physicalSize}
statusBarHeight : ${MediaQuery.of(context.value!).padding.top}
devicePixelRatio : ${MediaQuery.of(context.value!).devicePixelRatio}''');
  }

  /// 앱 업데이트 체크
  Future<bool> handleAppVersionCheck() async {
    final RxBool isCanUpdate = false.obs;

    await AppVersionChecker().checkUpdate().then((value) async {
      Logger().d('''
[AppUpdateCheck] 앱 업데이트 체크
canUpdate : ${value.canUpdate}
currentVersion : ${value.currentVersion}
newVersion : ${value.newVersion}
appURL : ${value.appURL}
errorMessage : ${value.errorMessage}''');

      if (value.canUpdate) {
        // 앱 업데이트가 필요할때
        isCanUpdate.value = true;
      } else {
        // 앱 업데이트가 필요 없을때
        isCanUpdate.value = false;
      }
    });

    return isCanUpdate.value;
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
