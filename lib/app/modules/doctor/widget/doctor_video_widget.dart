import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../globals/global_inkwell_widget.dart';
import '../../../service/utils_service.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../../../utils/formatter.dart';
import '../controller/doctor_detail_controller.dart';

/// 비디오 플레이어 위젯
///
/// [index] 비디오 인덱스
///
/// [controller] 의사 상세 컨트롤러
class DoctorVideoWidget extends StatelessWidget {
  DoctorVideoWidget({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  DoctorDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalInkWellWidget(
          onTap: () {
            controller.isPlaying.value = true;
            controller.youtubeController = YoutubePlayerController(
              initialVideoId:
                  controller.doctor.value.doctorContents![index].content,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
              ),
            );
            UtilsService.to.handleLandScap();
          },
          child: Stack(
            children: [
              Image.network(
                controller
                    .doctor.value.doctorContents![index].contentThumbnail!,
                width: 320.w,
                height: 170.w,
                cacheWidth: 639,
                // cacheHeight: 340,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                right: 0,
                bottom: 0,
                left: 0,
                child: Center(
                  child: Image.asset(
                    'assets/images/video/play_button.webp',
                    width: 50.w,
                    cacheWidth: 50,
                    // cacheHeight: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.w),
        Text(
          Formmater.dateTimeFormatYYMMDD(
            controller.doctor.value.doctorContents![index].createdAt,
          ),
          style: TextPath.TextF13W500.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          controller.doctor.value.doctorContents![index].title,
          style: TextPath.TextF14W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        SizedBox(height: 20.w),
      ],
    );
  }
}
