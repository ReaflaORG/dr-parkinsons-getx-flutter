// ignore_for_file: unnecessary_overrides, cast_nullable_to_non_nullable, inference_failure_on_collection_literal, inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../global_widget/global_dialog_widget.dart';
import '../model/permission_model.dart';

class PermissionService extends GetxService {
  static PermissionService get to => Get.find();

  // Data ▼ ============================================

  RxList<dynamic> permissionList = [
    PermissionModel(
      title: '위치기반',
      icon: Icon(
        Icons.location_on_outlined,
        size: 38.sp,
        color: Colors.grey.shade700,
      ),
      description: '주변 업체 정보 제공',
      isRequired: true,
      isExpanded: false,
    ),
  ].obs;

  // Variable ▼ ========================================

  /// 위치기반 허용 여부
  RxBool isLocationPermissionsGranted = false.obs;

  // Funcion ▼ ========================================

  /// 권한 허용 버튼
  Future<dynamic> handlePermissionOnPressed() async {
    final Map<Permission, PermissionStatus> permissionStatus = await [
      Permission.location,
    ].request();

    switch (permissionStatus[Permission.location]) {
      case PermissionStatus.denied:
        Logger().d('사용자가 요청한 기능에 대한 액세스를 거부한 경우');

        isLocationPermissionsGranted.value = false;
        await GlobalPermissionModalOpenAppSettingsWidget(controller: this);
        break;
      case PermissionStatus.granted:
        Logger().d('사용자가 요청한 기능에 대한 액세스 권한을 부여한 경우');

        handlePermissionGranted();
        break;
      case PermissionStatus.limited:
        Logger().d('사용자가 제한된 액세스를 위해 이 애플리케이션을 승인했습니다. iOS(iOS14+)에서만 지원됨');

        isLocationPermissionsGranted.value = false;
        break;
      case PermissionStatus.permanentlyDenied:
        Logger().d(
            '요청된 기능에 대한 권한이 영구적으로 거부되면 이 권한을 요청할 때 권한 대화 상자가 표시되지 않습니다. 사용자는 여전히 설정에서 권한 상태를 변경할 수 있습니다. Android에서만 지원됩니다.');

        isLocationPermissionsGranted.value = false;
        Get.back();
        await GlobalPermissionModalOpenAppSettingsWidget(controller: this);
        break;
      case PermissionStatus.restricted:
        Logger().d(
            'OS가 요청한 기능에 대한 액세스를 거부했습니다. 사용자는 자녀 보호 기능과 같은 활성 제한으로 인해 이 앱의 상태를 변경할 수 없습니다. iOS에서만 지원됩니다.');

        isLocationPermissionsGranted.value = false;
        await GlobalPermissionModalOpenAppSettingsWidget(controller: this);
        break;
      default:
        Logger().d('default');

        isLocationPermissionsGranted.value = false;
        await GlobalPermissionModalOpenAppSettingsWidget(controller: this);
        break;
    }

    // handlePermissionGranted();
  }

  /// 모달 취소 버튼
  Future<dynamic> handlePermissionDialogCancelOnPressed() async {
    Get.back();

    /// 권한의 허용이 필수인 경우
    // await Future.delayed(const Duration(milliseconds: 100), () async {
    //   await GlobalPermissionModalBottomSheetWidget(
    //     controller: this,
    //   );
    // });
  }

  /// 권한 재요청
  Future<dynamic> handlePermissionReOnPressed() async {
    Get.back();
    openAppSettings();
  }

  /// 권한 허용
  Future<dynamic> handlePermissionGranted() async {
    await GetStorage().write('initialize_permission', true);
    // Get.back();
    await Get.offAllNamed('/signin');
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
