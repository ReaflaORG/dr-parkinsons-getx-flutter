import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
        backgroundColor: Colors.black,
        body: OrientationBuilder(
          builder: (context, orientation) {
            // return FlickVideoPlayerWidget(orientation: orientation);
            return YoutubePlayerWidget(orientation: orientation);
          },
        ),
      ),
    );
  }
}

// Youtube 비디어 플레이어 위젯
class YoutubePlayerWidget extends GetView<DisorderDetailController> {
  const YoutubePlayerWidget({
    super.key,
    required this.orientation,
  });

  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: controller.youtubeController.value,
          aspectRatio: 18.5 / 9,
          bottomActions: [
            const SizedBox(width: 14),
            CurrentPosition(),
            const SizedBox(width: 8),
            ProgressBar(
              isExpanded: true,
            ),
            RemainingDuration(),
            const PlaybackSpeedButton(),
          ],
        ),
        builder: (context, player) {
          return Container(
            child: player,
          );
        },
      ),
    );
    // return Obx(
    //   () => YoutubePlayer(
    //     controller: controller.youtubeController.value,
    //     showVideoProgressIndicator: true,
    //   ),
    // );
  }
}

// Flick 비디오 플레이어 위젯
// class FlickVideoPlayerWidget extends GetView<DisorderDetailController> {
//   const FlickVideoPlayerWidget({
//     required this.orientation,
//     super.key,
//   });

//   final Orientation orientation;

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Stack(
//         children: [
//           FlickVideoPlayer(
//             flickManager: controller.flickManager.value,
//             systemUIOverlay: const [],
//             flickVideoWithControls: const FlickVideoWithControls(
//               controls: FlickPortraitControls(),
//               // videoFit: BoxFit.fitWidth,
//               videoFit: BoxFit.fitHeight,
//             ),
//             preferredDeviceOrientation: const [
//               // DeviceOrientation.portraitUp,
//               // DeviceOrientation.portraitDown,
//               DeviceOrientation.landscapeLeft,
//               DeviceOrientation.landscapeRight,
//             ],
//             // preferredDeviceOrientationFullscreen: const [
//             //   // DeviceOrientation.landscapeLeft,
//             //   // DeviceOrientation.landscapeRight,
//             //   DeviceOrientation.portraitUp,
//             //   DeviceOrientation.portraitDown,
//             // ],
//             // systemUIOverlay: const [
//             //   SystemUiOverlay.top,
//             //   SystemUiOverlay.bottom,
//             // ],
//             // systemUIOverlayFullscreen: const [
//             //   SystemUiOverlay.top,
//             //   SystemUiOverlay.bottom,
//             // ],
//           ),
//           // Positioned(
//           //   top: 0,
//           //   left: 0,
//           //   height: 30.w,
//           //   child: Column(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     crossAxisAlignment: CrossAxisAlignment.center,
//           //     children: [
//           //       Text("asd"),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
