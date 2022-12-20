import 'package:dr_parkinsons/app/theme/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AdvancedOverlayWidget extends StatelessWidget {
  final VideoPlayerController controller;

  const AdvancedOverlayWidget({Key? key, required this.controller})
      : super(key: key);

  // 현재 시간
  String getPolistion() {
    final duration = Duration(
        milliseconds: controller.value.position.inMilliseconds.round());

    return [duration.inMinutes, duration.inSeconds]
        .map((e) => e.remainder(60).toString().padLeft(2, '0'))
        .join(':');
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
            buildPlay(),
            Positioned(
                right: 32,
                top: 15 + MediaQuery.of(context).padding.top,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.white,
                  ),
                )),
            Positioned(
              left: 16,
              bottom: 20 + MediaQuery.of(context).padding.bottom,
              child: Text(getPolistion(),
                  style: TextPath.TextF12W400.copyWith(
                    color: Colors.white,
                  )),
            ),
            Positioned(
                bottom: 0 + MediaQuery.of(context).padding.bottom,
                left: 0,
                right: 0,
                child: buildIndicator(context)),
          ],
        ));
  }

  /// 진행률
  Widget buildIndicator(BuildContext context) => Container(
        margin: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width - 16,
        height: 16,
        child: VideoProgressIndicator(
          controller,
          allowScrubbing: true,
        ),
      );

  /// 재생 버튼
  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          color: Colors.black26,
          child: const Center(
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 70,
            ),
          ),
        );
}
