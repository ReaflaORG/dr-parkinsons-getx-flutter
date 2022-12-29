import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../globals/global_toast_widget.dart';
import '../../../models/welfare_model.dart';
import '../../../provider/provider.dart';

/// 사회복지제도 리스트 컨트롤러
class SocialWelfareDetailController extends GetxController {
  static SocialWelfareDetailController get to => Get.find();

  // Arguments ▼

  dynamic arguments = Get.arguments;

  // Controller ▼

  Rx<ScrollController> scrollController = ScrollController().obs;

  // Data ▼

  /// 사회복지제도 상세보기 데이터
  late Rx<WelfareModel> postData;

  // Variable ▼

  /// 로딩상태
  Rx<bool> isLoad = true.obs;

  /// 스크롤 감지
  Rx<bool> isScrollCheck = false.obs;

  /// 앱바 타이틀 애니메이션
  Rx<bool> isAppBarTitleAnimation = false.obs;

  // Function ▼

  /// 사회복지제도 상세보기 프로바이더
  Future<void> getSocialWelafrePostDetailProvider() async {
    try {
      await Provider.dio(
        method: 'GET',
        url: '/home/welfare/${arguments['id']}',
      ).then((value) {
        switch (value.statusCode) {
          case 200:
            postData = WelfareModel.fromJson(value.data).obs;
            break;
          default:
            throw Exception(value.message);
        }
      });
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    } finally {
      isLoad.value = false;
    }
  }

  /// 초기화
  Future<void> handleInitailize() async {
    await getSocialWelafrePostDetailProvider();

    // 스크롤 이벤트
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.value.addListener(() {
        // Logger().d('scrolling');
        if (scrollController.value.offset >= 170.w) {
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
    scrollController.value.dispose();

    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
