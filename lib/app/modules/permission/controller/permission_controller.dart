// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../model/permission_model.dart';

class PermissionController extends GetxController {
  static PermissionController get to => Get.find();

  // Funcion ▼ =========================================

  RxList<dynamic> permissionList = [
    PermissionModel(
      title: '위치 권한',
      image: 'assets/images/permission/location.svg',
      description: '위치기반 검색을 허용합니다',
      isRequired: true,
      isExpanded: false,
    ),
    PermissionModel(
      title: '주소록',
      image: 'assets/images/permission/address.svg',
      description: '가까운 의사, 병원 검색을 위한 용도입니다',
      isRequired: true,
      isExpanded: false,
    ),
    PermissionModel(
      title: '알림',
      image: 'assets/images/permission/notifications.svg',
      description: '새로운 이벤트나 혜택을 알려드립니다',
      isRequired: true,
      isExpanded: false,
    ),
    PermissionModel(
      title: '연락처',
      image: 'assets/images/permission/phone.svg',
      description: '휴대폰 사용자 본인인증 용도로 사용합니다',
      isRequired: true,
      isExpanded: false,
    ),
  ].obs;

  // Variable ▼ ========================================

  @override
  Future<void> onInit() async {
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
