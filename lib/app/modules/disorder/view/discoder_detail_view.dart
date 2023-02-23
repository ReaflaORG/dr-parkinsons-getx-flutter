import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
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
      child: OrientationBuilder(builder: (context, orientaion) {
        return FlickVideoPlayer(
          flickManager: controller.flickManager,
        );
      }),
    );
  }
}
