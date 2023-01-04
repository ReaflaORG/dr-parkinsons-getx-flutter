// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/models/welfare_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../provider/provider.dart';

/// 사회복지제도 리스트 컨트롤러
class SocialWelfareController extends GetxController {
  static SocialWelfareController get to => Get.find();

  // Controller ▼

  /// 스크롤 컨트롤러
  Rx<ScrollController> scrollController = ScrollController().obs;

  // Data ▼

  /// 사회복지제도 리스트 데이터
  late RxList<WelfareModel> welfareData = <WelfareModel>[].obs;

  // Variable ▼

  /// 로딩 상태
  Rx<bool> isLoad = true.obs;

  /// 스크롤 감지
  Rx<bool> isScrollCheck = false.obs;

  /// 앱바 타이틀 애니메이션
  Rx<bool> isAppBarTitleAnimation = false.obs;

  // Function ▼

  /// 사회복지제도 리스트 프로바이더
  Future<void> handleWelfareListProvider() async {
    try {
      await Provider.dio(
        method: 'GET',
        url: '/home/welfare',
      ).then((value) {
        switch (value.statusCode) {
          case 200:
            Future.value([
              welfareData.assignAll(
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

  /// 초기화
  Future<void> handleInitailize() async {
    await handleWelfareListProvider();

    // 스크롤 이벤트
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.value.addListener(() {
        // Logger().d('scrolling');
        if (scrollController.value.offset >= 30.w) {
          isScrollCheck.value = true;
          Future.delayed(const Duration(milliseconds: 100), () {
            isAppBarTitleAnimation.value = true;
          });
          return;
        }

        isScrollCheck.value = false;
        Future.delayed(const Duration(milliseconds: 100), () {
          isAppBarTitleAnimation.value = false;
        });
      });

      scrollController.value.position.isScrollingNotifier.addListener(() {
        if (!scrollController.value.position.isScrollingNotifier.value) {
          // Logger().d('scroll is stopped');
        } else {
          // Logger().d('scroll is started');
        }
      });
    });
  }

  @override
  Future<void> onInit() async {
    await handleInitailize();

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
