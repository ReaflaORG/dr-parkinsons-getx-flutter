import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../../globals/global_loader_indicator_widget.dart';
import 'advancedOverlayWidget.dart';

class VideoView extends StatefulWidget {
  const VideoView({
    super.key,
    required this.content_url,
  });

  final String content_url;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController? _controller;

  Future setLandScap() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    await Wakelock.enable();
  }

  Future setAllOrientations() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await Wakelock.disable();
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.content_url,
      videoPlayerOptions: VideoPlayerOptions(
        mixWithOthers: false,
        allowBackgroundPlayback: false,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((_) => _controller?.play());
    setLandScap();

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await setAllOrientations();
        Get.back();
        return Future.value(true);
      },
      child: SafeArea(
        child: Scaffold(
          body: _controller == null && !_controller!.value.isInitialized
              ? const GlobalLoaderIndicatorWidget()
              : OrientationBuilder(
                  builder: (context, orientaion) {
                    return BuildVideoWidget(
                      controller: _controller,
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class BuildVideoWidget extends StatelessWidget {
  const BuildVideoWidget({
    super.key,
    this.controller,
  });

  final VideoPlayerController? controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AspectRatio(
          aspectRatio: controller!.value.aspectRatio,
          child: VideoPlayer(controller!),
        ),
        Positioned.fill(
          child: AdvancedOverlayWidget(
            controller: controller!,
          ),
        ),
      ],
    );
  }
}
