// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../../../models/permission_model.dart';
import '../../../service/permission_service.dart';

class PermissionController extends GetxController {
  static PermissionController get to => Get.find();

  // Funcion ▼

  RxList<PermissionModel> permissionRequiredList = <PermissionModel>[].obs;
  RxList<PermissionModel> permissionOptionList = <PermissionModel>[].obs;

  // Variable ▼

  @override
  Future<void> onInit() async {
    Future.value([
      permissionRequiredList.assignAll(PermissionService.to.permissionList
          .where((element) => element.isRequired == true)),
      permissionOptionList.assignAll(PermissionService.to.permissionList
          .where((element) => element.isRequired == false)),
    ]);

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
