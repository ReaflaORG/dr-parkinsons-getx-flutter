import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../theme/text_path.dart';

class AdvancedOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const AdvancedOverlayWidget({
    super.key,
    required this.controller,
  });

  // 현재 시간
  String getPolistion() {
    final duration = Duration(
      milliseconds: controller.value.position.inMilliseconds.round(),
    );

    return [duration.inMinutes, duration.inSeconds]
        .map((e) => e.remainder(60).toString().padLeft(2, '0'))
        .join(':');
  }

  Future setAllOrientations() async {
    // await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlayStyle);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Wakelock.disable();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Stack(
        children: [
          PlayerWidget(
            controller: controller,
          ),
          Positioned(
            right: 32,
            top: 15 + MediaQuery.of(context).padding.top,
            child: InkWell(
              onTap: () {
                setAllOrientations();
                Get.back();
              },
              child: const Icon(
                Icons.close,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 20 + MediaQuery.of(context).padding.bottom,
            child: Text(
              getPolistion(),
              style: TextPath.TextF12W400.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 0 + MediaQuery.of(context).padding.bottom,
            left: 0,
            right: 0,
            child: IndicatorWidget(
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8).w,
      width: MediaQuery.of(context).size.width - 16,
      height: 16.w,
      child: VideoProgressIndicator(
        controller,
        allowScrubbing: true,
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return controller.value.isPlaying
        ? const SizedBox.shrink()
        : Container(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 70.sp,
              ),
            ),
          );
  }
}
