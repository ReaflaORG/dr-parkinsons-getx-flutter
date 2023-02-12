import 'package:dr_parkinsons/app/globals/global_inkwell_widget.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../models/doctor_model.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../../../utils/formatter.dart';

/// 비디오 플레이어 위젯
///
/// [data] DoctorContent: 데이터
class DoctorVideoWidget extends StatefulWidget {
  const DoctorVideoWidget({
    super.key,
    required this.data,
  });

  final DoctorContent data;

  @override
  State<DoctorVideoWidget> createState() => _DoctorVideoWidgetState();
}

class _DoctorVideoWidgetState extends State<DoctorVideoWidget> {
  late final FlickManager flickManager;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (isPlaying) {
      flickManager.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isPlaying
            ? SizedBox(
                width: 320.w,
                height: 170.w,
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                ),
              )
            : GlobalInkWellWidget(
                onTap: () {
                  setState(() {
                    isPlaying = true;
                    flickManager = FlickManager(
                      videoPlayerController: VideoPlayerController.network(
                        widget.data.content,
                      ),
                      autoPlay: true,
                    );
                  });
                },
                child: Container(
                  width: 320.w,
                  height: 170.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.data.contentThumbnail!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8).r,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/video/play_button.webp',
                      width: 50.w,
                      cacheWidth: 50,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
        // SizedBox(
        //   width: 320.w,
        //   height: 170.w,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.circular(8).r,
        //     child: YoutubePlayer(
        //       controller: YoutubePlayerController(
        //         initialVideoId: YoutubePlayer.convertUrlToId(
        //           controller.doctor.value.doctorContents![index].content,
        //         ) as String,
        //         flags: const YoutubePlayerFlags(
        //           mute: false,
        //           autoPlay: false,
        //           disableDragSeek: false,
        //           loop: false,
        //           isLive: false,
        //           forceHD: false,
        //           enableCaption: true,
        //           captionLanguage: 'ko',
        //         ),
        //       ),
        //       actionsPadding: const EdgeInsets.only(left: 15).w,
        //       // progressIndicatorColor: Colors.black,
        //       // progressColors: ProgressBarColors(
        //       //   backgroundColor: Colors.black,
        //       //   bufferedColor: Colors.black,
        //       //   playedColor: Colors.black,
        //       // ),
        //       thumbnail: Image.network(
        //         controller
        //             .doctor.value.doctorContents![index].contentThumbnail!,
        //         cacheWidth: 640,
        //         fit: BoxFit.fill,
        //       ),
        //       bottomActions: [
        //         CurrentPosition(),
        //         SizedBox(width: 10.w),
        //         ProgressBar(isExpanded: true),
        //         SizedBox(width: 10.w),
        //         RemainingDuration(),
        //         FullScreenButton(),
        //       ],
        //     ),
        //   ),
        // ),
        SizedBox(height: 10.w),
        Text(
          Formmater.dateTimeFormatYYMMDD(
            widget.data.createdAt,
          ),
          style: TextPath.TextF13W500.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          widget.data.title,
          style: TextPath.TextF14W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        SizedBox(height: 20.w),
      ],
    );
  }
}

/// 비디오 플레이어 위젯
///
/// [index] int: 비디오 인덱스
// class DoctorVideoWidget extends GetView<DoctorDetailController> {
//   final int index;

//   const DoctorVideoWidget({
//     super.key,
//     required this.index,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 320.w,
//           height: 170.w,
//           child: Chewie(
//             controller: ChewieController(
//               videoPlayerController: VideoPlayerController.network(
//                 controller.doctor.value.doctorContents![index].content,
//               ),
//               autoPlay: false,
//               looping: false,
//               overlay: Text("A"),
//             ),
//           ),
//         ),
//         // SizedBox(
//         //   width: 320.w,
//         //   height: 170.w,
//         //   child: ClipRRect(
//         //     borderRadius: BorderRadius.circular(8).r,
//         //     child: YoutubePlayer(
//         //       controller: YoutubePlayerController(
//         //         initialVideoId: YoutubePlayer.convertUrlToId(
//         //           controller.doctor.value.doctorContents![index].content,
//         //         ) as String,
//         //         flags: const YoutubePlayerFlags(
//         //           mute: false,
//         //           autoPlay: false,
//         //           disableDragSeek: false,
//         //           loop: false,
//         //           isLive: false,
//         //           forceHD: false,
//         //           enableCaption: true,
//         //           captionLanguage: 'ko',
//         //         ),
//         //       ),
//         //       actionsPadding: const EdgeInsets.only(left: 15).w,
//         //       // progressIndicatorColor: Colors.black,
//         //       // progressColors: ProgressBarColors(
//         //       //   backgroundColor: Colors.black,
//         //       //   bufferedColor: Colors.black,
//         //       //   playedColor: Colors.black,
//         //       // ),
//         //       thumbnail: Image.network(
//         //         controller
//         //             .doctor.value.doctorContents![index].contentThumbnail!,
//         //         cacheWidth: 640,
//         //         fit: BoxFit.fill,
//         //       ),
//         //       bottomActions: [
//         //         CurrentPosition(),
//         //         SizedBox(width: 10.w),
//         //         ProgressBar(isExpanded: true),
//         //         SizedBox(width: 10.w),
//         //         RemainingDuration(),
//         //         FullScreenButton(),
//         //       ],
//         //     ),
//         //   ),
//         // ),
//         SizedBox(height: 10.w),
//         Text(
//           Formmater.dateTimeFormatYYMMDD(
//             controller.doctor.value.doctorContents![index].createdAt,
//           ),
//           style: TextPath.TextF13W500.copyWith(
//             color: ColorPath.TextGrey1H212121,
//           ),
//         ),
//         SizedBox(height: 5.w),
//         Text(
//           controller.doctor.value.doctorContents![index].title,
//           style: TextPath.TextF14W600.copyWith(
//             color: ColorPath.TextGrey1H212121,
//           ),
//         ),
//         SizedBox(height: 20.w),
//       ],
//     );
//   }
// }
