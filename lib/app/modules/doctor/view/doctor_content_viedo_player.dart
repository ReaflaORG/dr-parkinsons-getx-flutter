import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

import '../widget/advancedOverlayWidget.dart';

class DoctorContentView extends StatefulWidget {
  final String content_url;
  const DoctorContentView({Key? key, required this.content_url})
      : super(key: key);

  @override
  State<DoctorContentView> createState() => _DoctorContentViewState();
}

class _DoctorContentViewState extends State<DoctorContentView> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.content_url)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((_) => _controller?.play());
    setLandScap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _controller != null && _controller!.value.isInitialized
          ? OrientationBuilder(builder: (context, orientaion) {
              return buildVideo();
            })
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Widget buildVideo() {
    return Stack(
      fit: StackFit.expand,
      children: [
        AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        ),
        Positioned.fill(
            child: AdvancedOverlayWidget(
          controller: _controller!,
        )),
      ],
    );
  }

  Future setLandScap() async {
    // await SystemChrome.setPreferredOrientations(
    //     [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    // 화면 꺼지지 않게
    await Wakelock.enable();
  }

  Future setAllOrientations() async {
    // await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlayStyle);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await Wakelock.disable();
  }

  @override
  void dispose() {
    _controller?.dispose();
    setAllOrientations();
    super.dispose();
  }
}
