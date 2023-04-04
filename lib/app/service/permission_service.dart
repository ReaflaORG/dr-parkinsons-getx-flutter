// ignore_for_file: unnecessary_overrides, cast_nullable_to_non_nullable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import '../globals/global_dialog_widget.dart';
import '../models/permission_model.dart';

class PermissionService extends GetxService {
  static PermissionService get to => Get.find();

  // Data ▼

  RxList<PermissionModel> permissionList = [
    PermissionModel(
      title: '위치 권한',
      image: 'assets/images/permission/location.png',
      description: '위치기반 검색을 허용합니다',
      isRequired: true,
      isExpanded: false,
    ),
    // PermissionModel(
    //   title: '주소록',
    //   image: 'assets/images/permission/address.png',
    //   description: '가까운 의사, 병원 검색을 위한 용도입니다',
    //   isRequired: false,
    //   isExpanded: false,
    // ),
    PermissionModel(
      title: '알림',
      image: 'assets/images/permission/notifications.png',
      description: '새로운 이벤트나 혜택을 알려드립니다',
      isRequired: false,
      isExpanded: false,
    ),
    // PermissionModel(
    //   title: '연락처',
    //   image: 'assets/images/permission/phone.png',
    //   description: '휴대폰 사용자 본인인증 용도로 사용합니다',
    //   isRequired: false,
    //   isExpanded: false,
    // ),
    PermissionModel(
      title: '카메라 및 앨범',
      icon: Icon(
        Icons.camera_alt_rounded,
        size: 32,
        color: Colors.grey.shade700,
      ),
      description: '프로필 이미지 업로드에 사용',
      isRequired: true,
      isExpanded: false,
    ),
    PermissionModel(
      title: '마이크',
      icon: Icon(
        Icons.mic_rounded,
        size: 32,
        color: Colors.grey.shade700,
      ),
      description: '프로필 동영상 업로드시 녹화에 사용',
      isRequired: true,
      isExpanded: false,
    ),
  ].obs;

  // Variable ▼

  /// 권한 프로세스 종료 체크
  RxBool isPermissionSuccess = false.obs;

  /// 위치기반 허용 여부
  RxBool isLocationPermissionsGranted = false.obs;

  // Funcion ▼

  /// 권한 허용 버튼
  Future<dynamic> handlePermissionOnPressed() async {
    final Map<Permission, PermissionStatus> permissionStatus = await [
      Permission.location,
      Permission.notification,
      Permission.camera,
      Permission.photos,
      Permission.microphone,
    ].request();

    for (var index = 0; index < permissionStatus.length; index++) {
      if (index == permissionStatus.length - 1) {
        isPermissionSuccess.value = true;
      }

      switch (permissionStatus[index]) {
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
          // * 여러 권한이 있는 경우에는 해당되지 않을 경우 넘긴다.
          handlePermissionGranted();
          break;
      }
    }

    // handlePermissionGranted();
  }

  /// 모달 취소 버튼
  Future<dynamic> handlePermissionDialogCancelOnPressed() async {
    Get.back();

    /// 권한의 허용이 필수인 경우
    // Future.delayed(const Duration(milliseconds: 100), () async {
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
    if (isPermissionSuccess.value) {
      await Future.value([
        GetStorage().write('initialize_permission', true),
        Get.offAllNamed('/signin'),
      ]);
    }
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
