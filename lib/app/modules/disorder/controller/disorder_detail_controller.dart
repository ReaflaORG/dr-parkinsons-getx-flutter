import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class DisorderDetailController extends GetxController {
  static DisorderDetailController get to => Get.find();

  dynamic arguments = Get.arguments['content_url'];
  late Rx<FlickManager> flickManager = FlickManager(
    videoPlayerController: VideoPlayerController.network(
      arguments,
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: false,
        allowBackgroundPlayback: false,
      ),
    ),
    autoInitialize: true,
    autoPlay: true,
  ).obs;

  Future setLandScap() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    await Wakelock.enable();
  }

  Future setAllOrientations() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await Wakelock.disable();
  }

  @override
  Future<void> onInit() async {
    // flickManager.value = FlickManager(
    //   videoPlayerController: VideoPlayerController.network(
    //     arguments,
    //     videoPlayerOptions: VideoPlayerOptions(
    //       mixWithOthers: false,
    //       allowBackgroundPlayback: false,
    //     ),
    //   ),
    //   autoInitialize: true,
    //   autoPlay: true,
    // );

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    flickManager.value.dispose();

    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
