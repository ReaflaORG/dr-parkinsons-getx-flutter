// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/disorder_model.dart';

class DisorderController extends GetxController {
  static DisorderController get to => Get.find();

  // Controller ▼

  /// 스크롤 컨트롤러
  Rx<ScrollController> scrollController = ScrollController().obs;

  // Data ▼

  /// 유튜브 비디오 데이터
  RxList<YoutubeVideoModel> youtubeVideoData = [
    YoutubeVideoModel(
      title: 'EP1 파킨슨증 핵심만 콕콕! 운동증상 비운동증상 알아봐요!',
      thumbnail: 'https://img.youtube.com/vi/Z_MXzuK9wjk/maxresdefault.jpg',
      createdAt: DateFormat('yyyy-MM-dd').parse('2022-10-7'),
      youtubePlayer: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=Z_MXzuK9wjk',
        ) as String,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          captionLanguage: 'ko',
        ),
      ),
    ),
    YoutubeVideoModel(
      title: 'EP2 파킨슨증이냐? 파킨슨병이냐? 진단 과정과 약물치료까지!',
      thumbnail: 'https://img.youtube.com/vi/Y3EfqMEou30/maxresdefault.jpg',
      createdAt: DateFormat('yyyy-MM-dd').parse('2022-10-21'),
      youtubePlayer: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=Y3EfqMEou30',
        ) as String,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          captionLanguage: 'ko',
        ),
      ),
    ),
    YoutubeVideoModel(
      title: 'EP3 파킨슨병 환자, 어떻게 지내고 먹고 치료할까?',
      thumbnail: 'https://img.youtube.com/vi/ISj6KAuk7z0/maxresdefault.jpg',
      createdAt: DateFormat('yyyy-MM-dd').parse('2022-10-27'),
      youtubePlayer: YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=ISj6KAuk7z0',
        ) as String,
        flags: const YoutubePlayerFlags(
          mute: false,
          autoPlay: false,
          disableDragSeek: false,
          loop: false,
          isLive: false,
          forceHD: false,
          enableCaption: true,
          captionLanguage: 'ko',
        ),
      ),
    ),
  ].obs;

  // 비디오 데이터
  RxList<Map<String, String>> videoData = [
    {
      'title': '파킨슨병이란 무엇인가?',
      'link':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_1_%EA%B3%A0%EC%84%B1%EB%B2%94.mp4',
      'thumbnail':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_1_%EA%B3%A0%EC%84%B1%EB%B2%94.webp',
    },
    {
      'title': '파킨슨병 VS 파킨슨증후군',
      'link':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_2_%EC%9D%B4%ED%95%84%ED%9C%B4.mp4',
      'thumbnail':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_2_%EC%9D%B4%ED%95%84%ED%9C%B4.webp'
    },
    {
      'title': '파킨스병 전구증상',
      'link':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_3_%EC%95%88%ED%83%9C%EB%B2%94.mp4',
      'thumbnail':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_3_%EC%95%88%ED%83%9C%EB%B2%94.webp'
    },
    {
      'title': '파킨슨병 진단과정',
      'link':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_4_%EB%B0%B1%EC%A2%85%EC%82%BC.mp4',
      'thumbnail':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_4_%EB%B0%B1%EC%A2%85%EC%82%BC.webp'
    },
    {
      'title': '파킨슨병 약물치료',
      'link':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_5_%EC%84%B1%EC%98%81%ED%9D%AC.mp4',
      'thumbnail':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_5_%EC%84%B1%EC%98%81%ED%9D%AC.webp'
    },
    {
      'title': '파킨슨 약제의 종류',
      'link':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_6_%EC%9D%B4%EC%9B%85%EC%9A%B0.mp4',
      'thumbnail':
          'https://s3.ap-northeast-2.amazonaws.com/dr.parkinsons/disorder/disorder_6_%EC%9D%B4%EC%9B%85%EC%9A%B0.webp'
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
