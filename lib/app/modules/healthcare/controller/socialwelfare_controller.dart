// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

class SocialWelfareController extends GetxController {
  static SocialWelfareController get to => Get.find();

  // Variable ▼

  Rx<int> socialWelfarePostData = 5.obs;

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
