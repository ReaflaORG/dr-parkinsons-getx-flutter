import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../../../utils/formatter.dart';
import '../controller/disorder_controller.dart';

/// 비디오 플레이어 위젯
///
/// [index] int: 비디오 인덱스
class DiscoderVideoWidget extends GetView<DisorderController> {
  const DiscoderVideoWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 320.w,
          height: 170.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8).r,
            child: YoutubePlayer(
              controller: controller.videoData[index].youtubePlayer,
              actionsPadding: const EdgeInsets.only(left: 15).w,
              // progressIndicatorColor: Colors.black,
              // progressColors: ProgressBarColors(
              //   backgroundColor: Colors.black,
              //   bufferedColor: Colors.black,
              //   playedColor: Colors.black,
              // ),
              thumbnail: Image.network(
                controller.videoData[index].thumbnail,
                fit: BoxFit.fill,
              ),
              bottomActions: [
                CurrentPosition(),
                SizedBox(width: 10.w),
                ProgressBar(isExpanded: true),
                SizedBox(width: 10.w),
                RemainingDuration(),
                FullScreenButton(),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.w),
        Text(
          Formmater.dateTimeFormatYYMMDD(
            controller.videoData[index].createdAt,
          ),
          style: TextPath.TextF13W500.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          controller.videoData[index].title,
          style: TextPath.TextF14W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        SizedBox(height: 20.w),
      ],
    );
  }
}
