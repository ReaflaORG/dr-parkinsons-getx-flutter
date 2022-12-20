// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/parkinson_post_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../provider/provider.dart';

class FactDetailController extends GetxController {
  static FactDetailController get to => Get.find();

  // Data ▼

  Rx<ParkinsonPostModel?> postData = (null as ParkinsonPostModel?).obs;

  // Variable ▼

  /// 로딩 상태
  Rx<bool> isLoad = true.obs;

  /// 완전 정복 상세보기 ID
  Rx<dynamic> parkinsonPostId = Get.parameters['id'].obs;

  // Function ▼

  /// 완전 정복 상세보기 API
  Future<void> getFactDetail() async {
    try {
      Logger().d(parkinsonPostId);

      await Provider.dio(
        method: 'GET',
        url: '/home/parkinson/${parkinsonPostId.value}',
      ).then((value) {
        switch (value.statusCode) {
          case 200:
            postData.value = ParkinsonPostModel.fromJson(value.data);
            isLoad.value = false;
            break;
          default:
            throw Exception(value.message);
        }
      });
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString());
    }
  }

  @override
  Future<void> onInit() async {
    await getFactDetail();

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
