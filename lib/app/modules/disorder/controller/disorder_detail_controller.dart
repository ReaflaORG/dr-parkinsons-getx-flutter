// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';

class DisorderDetailController extends GetxController {
  static DisorderDetailController get to => Get.find();

  dynamic arguments = Get.arguments['content_url'];

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
