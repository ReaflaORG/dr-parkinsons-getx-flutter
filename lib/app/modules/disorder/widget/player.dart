import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/disorder_controller.dart';

/// 유튜브 플레이어 위젯
class YoutubePlayerWidget extends GetView<DisorderController> {
  final int index;

  const YoutubePlayerWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 320.w,
          height: 180.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: YoutubePlayer(
              controller: controller.disorderData[index].youtubePlayer,
              actionsPadding: const EdgeInsets.only(left: 15),
              // progressIndicatorColor: Colors.black,
              // progressColors: ProgressBarColors(
              //   backgroundColor: Colors.black,
              //   bufferedColor: Colors.black,
              //   playedColor: Colors.black,
              // ),
              thumbnail: Image.network(
                controller.disorderData[index].thumbnail as String,
                fit: BoxFit.cover,
              ),
              bottomActions: [
                CurrentPosition(),
                const SizedBox(width: 10),
                ProgressBar(isExpanded: true),
                const SizedBox(width: 10),
                RemainingDuration(),
                FullScreenButton(),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
