// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/disorder_model.dart';

class DisorderController extends GetxController {
  static DisorderController get to => Get.find();

  // Data ▼

  RxList<YoutubeVideoModel> videoData = [
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

  @override
  Future<void> onInit() async {
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
