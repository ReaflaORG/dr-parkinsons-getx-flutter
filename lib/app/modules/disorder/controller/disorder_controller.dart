// ignore_for_file: unnecessary_overrides

import 'dart:async';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/disorder_model.dart';

class DisorderController extends GetxController {
  static DisorderController get to => Get.find();

  // Data ▼ ============================================
  RxList<DisorderModel> disorderData = [
    DisorderModel(
      thumbnail: 'https://img.youtube.com/vi/Z_MXzuK9wjk/maxresdefault.jpg',
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
    DisorderModel(
      thumbnail: 'https://img.youtube.com/vi/Y3EfqMEou30/maxresdefault.jpg',
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
    DisorderModel(
      thumbnail: 'https://img.youtube.com/vi/ISj6KAuk7z0/maxresdefault.jpg',
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

  // Function ▼ ========================================

  // Variable ▼ ========================================

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
