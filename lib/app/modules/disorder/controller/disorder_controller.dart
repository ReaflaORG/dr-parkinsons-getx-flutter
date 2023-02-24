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
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_1_%EA%B3%A0%EC%84%B1%EB%B2%94.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_1.webp',
    },
    {
      'title': '파킨슨병 VS 파킨슨증후군',
      'description': '차이점을 알아봐요',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_2_%EC%9D%B4%ED%95%84%ED%9C%B4.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_2.webp'
    },
    {
      'title': '파킨스병 전구증상',
      'description': '나한테도 이런 증상이?',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_3_%EC%95%88%ED%83%9C%EB%B2%94.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_3.webp'
    },
    {
      'title': '파킨슨병 진단과정',
      'description': '진단과정 미리 알아보자!',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_4_%EB%B0%B1%EC%A2%85%EC%82%BC.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_4.webp'
    },
    {
      'title': '파킨슨병 약물치료',
      'description': '약물치료엔 어떤것이 있을까?',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_5_%EC%84%B1%EC%98%81%ED%9D%AC.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_5.webp'
    },
    {
      'title': '파킨슨 약제의 종류',
      'description': '약제! 꼭 알고 먹어요',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_6_%EC%9D%B4%EC%9B%85%EC%9A%B0.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_6.webp'
    },
    {
      'title': '파킨슨병은 치매와 어떤 연관이 있나요?',
      'description': '',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_7_%EA%B6%8C%EB%8F%84%EC%98%81.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_7.webp'
    },
    {
      'title': '닥터파킨슨으로 내 약물을 스스로 검색해보세요',
      'description': '',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_8_%EC%84%B1%EC%98%81%ED%9D%AC.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_8.webp'
    },
    {
      'title': '파킨슨 환자의 보행장애 극복',
      'description': '',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_9_%EC%84%B1%EC%98%81%ED%9D%AC.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_9.webp'
    },
    {
      'title': '파킨슨 환자의 건강한 식생활',
      'description': '',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_10_%EC%84%B1%EC%98%81%ED%9D%AC.mp4',
      'thumbnail':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_10.webp'
    },
    {
      'title': '떨리면 다 파킨슨? No!!',
      'description': '',
      'link':
          'https://dr-parkinsons.s3.ap-northeast-2.amazonaws.com/disorder/disorder_11_%EC%9C%A0%EB%8B%AC%EB%9D%BC.mp4',
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
