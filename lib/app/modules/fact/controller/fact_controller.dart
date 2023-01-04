// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:dr_parkinsons/app/globals/global_toast_widget.dart';
import 'package:dr_parkinsons/app/models/parkinson_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../models/base_response_model.dart';
import '../../../provider/provider.dart';

class FactController extends GetxController {
  static FactController get to => Get.find();

  // Data ▼

  /// 파킨슨병 완전정복 데이터
  late RxList<ParkinsonPostModel> factData;

  // Controller ▼

  /// 스크롤 컨트롤러
  Rx<ScrollController> scrollController = ScrollController().obs;

  // Variable ▼

  /// 로딩상태
  Rx<bool> isLoad = true.obs;

  /// 스크롤 감지
  Rx<bool> isScrollCheck = false.obs;

  /// 앱바 타이틀 애니메이션
  Rx<bool> isAppBarTitleAnimation = false.obs;

  // Function ▼

  // 파킨슨병 완전정복 프로바이더
  Future<void> handleFactProvider() async {
    try {
      AuthBaseResponseModel response = await Provider.dio(
        method: 'GET',
        url: '/home/parkinson',
      );

      switch (response.statusCode) {
        case 200:
          factData = List.generate(
            response.data.length,
            (index) => ParkinsonPostModel.fromJson(
              response.data[index],
            ),
          ).obs;
          break;
        default:
          throw Exception(response.message);
      }
    } catch (e) {
      Logger().d(e);
      GlobalToastWidget(e.toString().substring(11));
    } finally {
      isLoad.value = false;
    }
  }

  /// 초기화
  Future<void> handleInitailize() async {
    await handleFactProvider();

    // 스크롤 이벤트
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.value.addListener(() {
        // Logger().d('scrolling');
        if (scrollController.value.offset >= 20.w) {
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
