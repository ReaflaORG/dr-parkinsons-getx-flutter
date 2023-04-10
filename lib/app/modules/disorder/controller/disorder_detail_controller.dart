import 'dart:async';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../service/utils_service.dart';

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

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    flickManager.value.dispose();
    Future.wait([
      UtilsService.to.handlePortrait(),
      UtilsService.to.handleShowSystemUI(),
    ]);

    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
