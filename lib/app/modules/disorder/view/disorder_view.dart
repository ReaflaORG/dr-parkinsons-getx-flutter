import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_layout_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/disorder_controller.dart';
import '../widget/discoder_video_widget.dart';

class DisorderView extends GetView<DisorderController> {
  const DisorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLayoutWidget(
      context: context,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        shadowColor: Colors.white,
        title: Text(
          '파킨슨 병 소개',
          style: TextPath.Heading2F18W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20).w,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: List.generate(
              controller.videoData.length,
              (index) {
                return VideoCardWiget(index: index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// 영상 카드 위젯
class VideoCardWiget extends StatelessWidget {
  const VideoCardWiget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return DiscoderVideoWidget(
      index: index,
    );
  }
}
