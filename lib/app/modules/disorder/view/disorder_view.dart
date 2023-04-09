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
        body: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
          ).w,
          child: GridView.builder(
            controller: controller.scrollController.value,
            scrollDirection: Axis.vertical,
            itemCount: controller.videoData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 0.60.w,
              childAspectRatio: 0.60.w,
              mainAxisSpacing: 20.w,
              crossAxisSpacing: 20.w,
            ),
            itemBuilder: (BuildContext context, int index) {
              return DiscoderCardWidget(
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
        ),
      ),
    );
  }
}

class DiscoderCardWidget extends GetView<DisorderController> {
  const DiscoderCardWidget({
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
              width: double.infinity,
              height: 150.w,
              child: Stack(
                children: [
                  // Container(
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: NetworkImage(
                  //         controller.videoData[index]['thumbnail']!,
                  //       ),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  Image.network(
                    controller.videoData[index]['thumbnail']!,
                    cacheWidth: 300,
                    cacheHeight: 300,
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
                  // `CachedNetworkImage` 위젯 오류 이슈 있는듯함
                  // CachedNetworkImage(
                  //   imageUrl: controller.videoData[index]['thumbnail']!,
                  //   fit: BoxFit.cover,
                  //   placeholder: (context, url) {
                  //     return Center(
                  //       child: CircularProgressIndicator(
                  //         color: ColorPath.PrimaryColor.withOpacity(0.1),
                  //       ),
                  //     );
                  //   },
                  //   errorWidget: (context, url, error) {
                  //     return const Icon(Icons.error);
                  //   },
                  // ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(
                      Icons.smart_display_rounded,
                      size: 20.w,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),

            // 조회수
            // Positioned(
            //   top: 15,
            //   right: 10,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 5.w),
            //     decoration: BoxDecoration(
            //       color: Colors.black54,
            //       borderRadius: BorderRadius.circular(8).r,
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(
            //           Icons.check_rounded,
            //           size: 8.w,
            //           color: Colors.white70,
            //         ),
            //         SizedBox(width: 2.5.w),
            //         Text(
            //           '523',
            //           style: TextPath.TextF12W600.copyWith(
            //             color: Colors.white70,
            //             fontSize: 10.sp,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ),
          SizedBox(height: 10.w),
          Text(
            controller.videoData[index]['title']!,
            style: TextPath.TextF14W600.copyWith(
              color: ColorPath.BlackColor,
            ),
          ),
          SizedBox(height: 5.w),
          Text(
            controller.videoData[index]['description']!,
            style: TextPath.TextF12W600.copyWith(
              color: ColorPath.BlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
