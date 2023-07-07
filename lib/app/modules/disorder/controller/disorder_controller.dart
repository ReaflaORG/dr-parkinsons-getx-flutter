// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DisorderController extends GetxController {
  static DisorderController get to => Get.find();

  // Controller ▼

  /// 스크롤 컨트롤러
  Rx<ScrollController> scrollController = ScrollController().obs;

  // Data ▼

  // 비디오 데이터
  RxList<Map<String, String>> videoData = [
    {
      'title': '파킨슨병이란 무엇인가?',
      'description': '전문의가 알려주는 파킨슨병!',
      'link': '6pbiRmMXmCI',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_1.webp',
    },
    {
      'title': '파킨슨병 VS 파킨슨증후군',
      'description': '차이점을 알아봐요',
      'link': '44zjrMP-Qm8',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_2.webp'
    },
    {
      'title': '파킨스병 전구증상',
      'description': '나한테도 이런 증상이?',
      'link': 'GMnEKguo0Dc',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_3.webp'
    },
    {
      'title': '파킨슨병 진단과정',
      'description': '진단과정 미리 알아보자!',
      'link': 'UX_efnI23b0',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_4.webp'
    },
    {
      'title': '파킨슨병 약물치료',
      'description': '약물치료엔 어떤것이 있을까?',
      'link': 'qajlhFOxYzI',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_5.webp'
    },
    {
      'title': '파킨슨 약제의 종류',
      'description': '약제! 꼭 알고 먹어요',
      'link': 'KeT9UNAj5bs',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_6.webp'
    },
    {
      'title': '파킨슨병은 치매와 어떤 연관이 있나요?',
      'description': '',
      'link': '9YPKkxnUksE',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_7.webp'
    },
    {
      'title': '닥터파킨슨으로 내 약물을 스스로 검색해보세요',
      'description': '',
      'link': 'i0dirtkarII',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_8.webp'
    },
    {
      'title': '파킨슨 환자의 보행장애 극복',
      'description': '',
      'link': 'dm0XmeMs-6w',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_9.webp'
    },
    {
      'title': '파킨슨 환자의 건강한 식생활',
      'description': '',
      'link': '4AyBo0QwEhY',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_10.webp'
    },
    {
      'title': '떨리면 다 파킨슨? No!!',
      'description': '',
      'link': 'P6fJMmBkQB4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_11.webp'
    },
  ].obs;

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
