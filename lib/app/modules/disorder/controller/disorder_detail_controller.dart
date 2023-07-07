import 'dart:async';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../service/utils_service.dart';

class DisorderDetailController extends GetxController {
  static DisorderDetailController get to => Get.find();

  // 영상 링크
  dynamic arguments = Get.arguments['link'];

  late Rx<YoutubePlayerController> youtubeController = YoutubePlayerController(
    initialVideoId: arguments,
    flags: const YoutubePlayerFlags(
      enableCaption: false,
      autoPlay: true,
      mute: false,
      useHybridComposition: true,
      showLiveFullscreenButton: false,
    ),
  ).obs;

  // late Rx<FlickManager> flickManager = FlickManager(
  //   videoPlayerController: VideoPlayerController.network(
  //     arguments,
  //     videoPlayerOptions: VideoPlayerOptions(
  //       mixWithOthers: false,
  //       allowBackgroundPlayback: false,
  //     ),
  //   ),
  //   autoInitialize: true,
  //   autoPlay: true,
  // ).obs;

  @override
  Future<void> onInit() async {
    // UtilsService.to.handleLandScap();
    youtubeController.value.toggleFullScreenMode();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() async {
    // flickManager.value.dispose();
    youtubeController.value.dispose();
    UtilsService.to.handleShowSystemUI();

    // Future.wait([
    //   UtilsService.to.handlePortrait(),
    // ]);

    // 1초 뒤 UtilsService.to.handlePortrait() 실행
    // Future.delayed(const Duration(seconds: 1), () async {
    //   await UtilsService.to.handlePortrait();
    // });

    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onStart => super.onStart;

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
