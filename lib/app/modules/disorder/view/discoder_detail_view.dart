import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

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
              return Obx(
                () => FlickVideoPlayer(
                  flickManager: controller.flickManager.value,
                  flickVideoWithControls: const FlickVideoWithControls(
                    controls: FlickPortraitControls(),
                    videoFit: BoxFit.fitWidth,
                    // videoFit: orientation == Orientation.portrait
                    //     ? BoxFit.fitWidth
                    //     : BoxFit.fitWidth,
                  ),
                  preferredDeviceOrientation: const [
                    DeviceOrientation.portraitUp,
                    DeviceOrientation.portraitDown,
                    // DeviceOrientation.landscapeLeft,
                    // DeviceOrientation.landscapeRight,
                  ],
                  preferredDeviceOrientationFullscreen: const [
                    // DeviceOrientation.portraitUp,
                    // DeviceOrientation.portraitDown,
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
