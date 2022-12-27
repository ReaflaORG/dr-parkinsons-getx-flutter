// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/models/welfare_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../provider/provider.dart';

/// 사회복지제도 리스트 컨트롤러
class SocialWelfareController extends GetxController {
  static SocialWelfareController get to => Get.find();

  // Data ▼

  /// 사회복지제도 리스트 데이터
  late RxList<WelfareModel> welfareDatas = <WelfareModel>[].obs;

  // Variable ▼

  /// 로딩 상태
  Rx<bool> isLoad = true.obs;

  // Function ▼

  /// 사회복지제도 리스트 프로바이더
  Future<void> getWelfareListProvider() async {
    try {
      await Provider.dio(
        method: 'GET',
        url: '/home/welfare',
      ).then((value) {
        switch (value.statusCode) {
          case 200:
            Future.value([
              welfareDatas.assignAll(
                List.generate(
                  value.data.length,
                  (index) => WelfareModel.fromJson(
                    value.data[index],
                  ),
                ),
              ),
              isLoad.value = false,
            ]);
            break;
          default:
            throw Exception(value.message);
        }
      });
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString());
    }
  }

  @override
  Future<void> onInit() async {
    await getWelfareListProvider();

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
