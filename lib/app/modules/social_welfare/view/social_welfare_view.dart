import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/social_welfare_controller.dart';

/// 사회복지제도 리스트 페이지
class SocialWelfareView extends GetView<SocialWelfareController> {
  const SocialWelfareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '파킨슨 사회복지제도',
          elevation: controller.isScrollCheck.value ? 1 : 0,
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController.value,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 50).w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                controller.welfareData.length,
                (index) {
                  return CardWidget(
                    index: index,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 카드 위젯
class CardWidget extends GetView<SocialWelfareController> {
  const CardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalInkWellWidget(
          borderRadius: 8.r,
          onTap: () {
            Get.toNamed(
              '/socialwelfare/socialwelfarepost',
              arguments: {
                'id': controller.welfareData[index].welfare_id,
                'image': controller.welfareData[index].image,
              },
            );
          },
          child: Hero(
            tag: controller.welfareData[index].welfare_id,
            child: Container(
              alignment: Alignment.bottomLeft,
              height: 130.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    controller.welfareData[index].image,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8).r,
              ),
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
                  controller.welfareData[index].title,
                  style: TextPath.Heading3F16W600.copyWith(
                    color: ColorPath.TextWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.w),
      ],
    );
  }
}
