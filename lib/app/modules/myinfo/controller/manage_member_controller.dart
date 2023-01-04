// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

import '../models/manage_member_item_model.dart';

// manage member controller
class ManageMemeberController extends GetxController {
  static ManageMemeberController get to => Get.find();

  // Data ▼
  // manage member item model
  ManageMemberItemModel listArray =
      ManageMemberItemModel(isLogin: false, isMember: false);

  // Function ▼

  // Variable ▼

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
