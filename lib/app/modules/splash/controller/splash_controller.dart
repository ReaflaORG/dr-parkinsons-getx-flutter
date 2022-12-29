// ignore_for_file: unnecessary_overrides

import 'dart:async';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals/global_dialog_widget.dart';
import '../../../service/global_service.dart';
import '../../../service/permission_service.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  // Function ▼

  /// 스플래시 화면 처리
  Future<void> handleSplashDelayed({
    int milliseconds = 3000,
  }) async {
    Future.delayed(Duration(milliseconds: milliseconds), () async {
      if (GetStorage().read('initialize_permission') == null) {
        if (PermissionService.to.permissionList.isNotEmpty) {
          await Get.offAllNamed('/permission');
        } else {
          await Get.offAllNamed('/signin');
        }
      } else {
        await Get.offAllNamed('/signin');
      }
    });
  }

  /// 컨트롤러 초기화
  Future<void> handleInitialization() async {
    /// 앱 버전 체크
    if (await GlobalService.to.handleAppVersionCheck()) {
      GlobalAppVersionUpgradeModalWidget(
        cancelOnPressed: () async {
          Get.back();
          await handleSplashDelayed();
        },
        okOnPressed: () async {
          await handleSplashDelayed();
          await launchUrl(Uri.parse(Platform.isAndroid
              ? "market://details?id=${dotenv.env['APP_AOS_PACKAGE_NAME']}"
              : "itms-appss://apps.apple.com/app/${dotenv.env['APP_IOS_ID']}"));
        },
      );
    } else {
      await handleSplashDelayed();
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
