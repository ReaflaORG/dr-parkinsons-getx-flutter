import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/disorder_controller.dart';

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
        body: SingleChildScrollView(
          controller: controller.scrollController.value,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 20.w, bottom: 50.w),
            child: Column(
              children: [
                // SizedBox(height: 30.w),
                // Text(
                //   '파킨슨 병과 안내과정 소개',
                //   style: TextPath.Heading2F18W600,
                // ),
                // SizedBox(height: 30.w),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.videoData.length,
                  itemBuilder: (context, index) {
                    return DiscoderImageWidget(
                      index: index,
                      onTap: () {
                        Get.toNamed(
                          '/disorder/detail',
                          arguments: {
                            'content_url': controller.videoData[index]['link'],
                          },
                        );
                      },
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

class DiscoderImageWidget extends GetView<DisorderController> {
  const DiscoderImageWidget({
    super.key,
    required this.index,
    required this.onTap,
  });

  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20).w,
      width: double.infinity,
      height: 180.w,
      child: GlobalInkWellWidget(
        borderRadius: 8.r,
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    controller.videoData[index]['thumbnail']!,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8).r,
              ),
            ),
            Positioned.fill(
              child: Center(
                child: Image.asset(
                  'assets/images/video/play_button.webp',
                  fit: BoxFit.contain,
                  width: 50.w,
                ),
              ),
            ),
            Positioned(
              left: 10.w,
              bottom: 10.w,
              child: Container(
                margin: const EdgeInsets.all(10).w,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ).w,
                decoration: BoxDecoration(
                  color: ColorPath.PrimaryColor.withOpacity(
                    0.8,
                  ),
                  borderRadius: BorderRadius.circular(4).r,
                ),
                child: Text(
                  controller.videoData[index]['title']!,
                  style: TextPath.Heading3F16W600.copyWith(
                    color: ColorPath.TextWhite,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
