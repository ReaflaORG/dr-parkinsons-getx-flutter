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
        body: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ).w,
          child: GridView.builder(
            controller: controller.scrollController.value,
            scrollDirection: Axis.vertical,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.welfareData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 1 / 1.35,// 가로 / 세로 비율
              childAspectRatio: Get.width / (Get.height / 1.8), // 가로 / 세로 비율
              mainAxisSpacing: 20.w,
              crossAxisSpacing: 20.w,
            ),
            itemBuilder: (BuildContext context, int index) {
              return CardWidget(
                index: index,
                onTap: () {
                  Get.toNamed(
                    '/socialwelfare/socialwelfarepost',
                    arguments: {
                      'id': controller.welfareData[index].welfare_id,
                      'image': controller.welfareData[index].image,
                    },
                  );
                },
              );
            },
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
    required this.onTap,
  });

  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GlobalInkWellWidget(
      borderRadius: 8.r,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8).r,
            child: SizedBox(
              height: 125.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: controller.welfareData[index].welfare_id,
                    child: Image.network(
                      controller.welfareData[index].image,
                      cacheWidth: 300,
                      // cacheHeight: 300,
                      fit: BoxFit.cover,
                      // filterQuality: FilterQuality.medium,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorPath.PrimaryColor.withOpacity(0.1),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(
                      Icons.article_rounded,
                      size: 20.w,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Stack(
          //   children: [
          //     Hero(
          //       tag: controller.welfareData[index].welfare_id,
          //       child: SizedBox(
          //         height: 125.w,
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(8).r,
          //           child: Image.network(
          //             controller.welfareData[index].image,
          //             cacheWidth: 300,
          //             // cacheHeight: 300,
          //             fit: BoxFit.cover,
          //             // filterQuality: FilterQuality.medium,
          //             loadingBuilder: (context, child, loadingProgress) {
          //               if (loadingProgress == null) return child;
          //               return Center(
          //                 child: CircularProgressIndicator(
          //                   color: ColorPath.PrimaryColor.withOpacity(0.1),
          //                 ),
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: 10,
          //       left: 10,
          //       child: Icon(
          //         Icons.article_rounded,
          //         size: 20.w,
          //         color: Colors.black54,
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: 10.w),
          Text(
            controller.welfareData[index].title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: false,
            style: TextPath.TextF14W600.copyWith(
              color: ColorPath.BlackColor,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       GlobalInkWellWidget(
  //         borderRadius: 8.r,
  //         onTap: onTap,
  //         child: Hero(
  //           tag: controller.welfareData[index].welfare_id,
  //           child: Container(
  //             alignment: Alignment.bottomLeft,
  //             height: 150.w,
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: NetworkImage(
  //                   controller.welfareData[index].image,
  //                 ),
  //                 fit: BoxFit.cover,
  //               ),
  //               borderRadius: BorderRadius.circular(8).r,
  //             ),
  //             child: Container(
  //               margin: const EdgeInsets.all(10).w,
  //               padding: const EdgeInsets.symmetric(
  //                 horizontal: 6,
  //                 vertical: 2,
  //               ).w,
  //               decoration: BoxDecoration(
  //                 color: ColorPath.BlackColor.withOpacity(
  //                   0.8,
  //                 ),
  //                 borderRadius: BorderRadius.circular(4).r,
  //               ),
  //               child: Text(
  //                 controller.welfareData[index].title,
  //                 style: TextPath.Heading3F16W600.copyWith(
  //                   color: ColorPath.TextWhite,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       SizedBox(height: 10.w),
  //     ],
  //   );
  // }
}
