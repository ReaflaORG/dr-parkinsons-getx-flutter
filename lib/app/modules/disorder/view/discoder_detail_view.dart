import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../globals/global_inkwell_widget.dart';
import '../../../service/utils_service.dart';
import '../controller/disorder_detail_controller.dart';

class DiscoderDetailView extends GetView<DisorderDetailController> {
  const DiscoderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return Future.value(true);
      },
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GlobalInkWellWidget(
            onTap: () async {
              await UtilsService.to.handlePortrait();
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            return FlickVideoPlayerWidget(orientation: orientation);
          },
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
      () => Stack(
        children: [
          FlickVideoPlayer(
            flickManager: controller.flickManager.value,
            systemUIOverlay: const [],
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
            // preferredDeviceOrientationFullscreen: const [
            //   DeviceOrientation.landscapeLeft,
            //   DeviceOrientation.landscapeRight,
            //   // DeviceOrientation.portraitUp,
            //   // DeviceOrientation.portraitDown,
            // ],
            // systemUIOverlay: const [
            //   SystemUiOverlay.top,
            //   SystemUiOverlay.bottom,
            // ],
            // systemUIOverlayFullscreen: const [
            //   SystemUiOverlay.top,
            //   SystemUiOverlay.bottom,
            // ],
          ),
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   height: 30.w,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Text("asd"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
