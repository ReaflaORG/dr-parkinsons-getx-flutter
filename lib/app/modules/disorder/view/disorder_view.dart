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
        elevation: 0,
        shadowColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          '파킨슨 병 소개',
          style: TextPath.Heading2F18W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20).w,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 30.w),
              Text(
                '파킨슨 병과 안내과정 소개',
                style: TextPath.Heading2F18W600,
              ),
              SizedBox(height: 30.w),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.imageData.length,
                itemBuilder: (context, index) {
                  return DiscoderImageWidget(
                    index: index,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
