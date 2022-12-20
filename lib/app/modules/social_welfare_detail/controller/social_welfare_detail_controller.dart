// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/models/welfare_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../provider/provider.dart';

/// 사회복지제도 리스트 컨트롤러
class SocialWelfareDetailController extends GetxController {
  static SocialWelfareDetailController get to => Get.find();

  // Data

  /// 로딩상태
  Rx<bool> isLoad = true.obs;

  /// 사회복지제도 상세보기 데이터
  Rx<WelfareModel?> postData = (null as WelfareModel?).obs;

  // Function

  /// 사회복지제도 상세보기 프로바이더
  Future<void> getSocialWelafrePostDetailProvider() async {
    try {
      isLoad.value = true;

      await Provider.dio(
        method: 'GET',
        url: '/home/welfare/${Get.arguments['id']}',
      ).then((value) {
        switch (value.statusCode) {
          case 200:
            Future.value([
              postData = WelfareModel.fromJson(value.data).obs,
              isLoad.value = false,
            ]);
            break;
          default:
            throw Exception(value.message);
        }
      });
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(message: e.toString());
    } finally {
      isLoad.value = false;
    }
  }

  @override
  Future<void> onInit() async {
    await getSocialWelafrePostDetailProvider();

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
