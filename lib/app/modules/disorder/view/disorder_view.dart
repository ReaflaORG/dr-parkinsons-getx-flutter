import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../theme/text_path.dart';
import '../controller/disorder_controller.dart';
import '../widget/discoder_video_widget.dart';

class DisorderView extends GetView<DisorderController> {
  const DisorderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '파킨슨 병 소개',
          elevation: controller.isScrollCheck.value ? 1 : 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            controller: controller.scrollController.value,
            padding: const EdgeInsets.symmetric(horizontal: 20).w,
            physics: const BouncingScrollPhysics(),
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
                SizedBox(height: 100.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
