// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SeminarController extends GetxController {
  static SeminarController get to => Get.find();

  // Controller ▼

  /// 스크롤 컨트롤러
  Rx<ScrollController> scrollController = ScrollController().obs;

  // Variable ▼

  /// 스크롤 감지
  Rx<bool> isScrollCheck = false.obs;

  /// 앱바 타이틀 애니메이션
  Rx<bool> isAppBarTitleAnimation = false.obs;

  /// 초기화
  Future<void> handleInitailize() async {
    // 스크롤 이벤트
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.value.addListener(() {
        // Logger().d('scrolling');
        if (scrollController.value.offset >= 200.w) {
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
