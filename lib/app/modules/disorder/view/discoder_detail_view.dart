import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../controller/disorder_detail_controller.dart';

class DiscoderDetailView extends GetView<DisorderDetailController> {
  const DiscoderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await controller.setAllOrientations();
        Get.back();
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              Logger().d(orientation);

              return FlickVideoPlayerWidget(orientation: orientation);
            },
          ),
        ),
      ),
    );
  }
}

// Flick 비디오 플레이어 위젯
class FlickVideoPlayerWidget extends GetView<DisorderDetailController> {
  const FlickVideoPlayerWidget({
    required this.orientation,
    super.key,
  });

  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FlickVideoPlayer(
        flickManager: controller.flickManager.value,
        flickVideoWithControls: const FlickVideoWithControls(
          controls: FlickPortraitControls(),
          // videoFit: BoxFit.fitWidth,
          videoFit: BoxFit.fitHeight,
        ),
        preferredDeviceOrientation: const [
          // DeviceOrientation.portraitUp,
          // DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ],
        preferredDeviceOrientationFullscreen: const [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
          // DeviceOrientation.portraitUp,
          // DeviceOrientation.portraitDown,
        ],
        // systemUIOverlay: const [
        //   SystemUiOverlay.top,
        //   SystemUiOverlay.bottom,
        // ],
        // systemUIOverlayFullscreen: const [
        //   SystemUiOverlay.top,
        //   SystemUiOverlay.bottom,
        // ],
      ),
    );
  }
}
