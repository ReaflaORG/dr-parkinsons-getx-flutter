import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_loader_indicator_widget.dart';
import '../../../globals/global_toast_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/social_welfare_detail_controller.dart';

/// 사회복지제도 상세 페이지
class SocialWelfareDetailView extends GetView<SocialWelfareDetailController> {
  const SocialWelfareDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        isSafeArea: false,
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: controller.scrollController.value,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 242.w,
                    child: Hero(
                      tag: controller.arguments['id'],
                      child: CachedNetworkImage(
                        imageUrl: controller.arguments['image'],
                        // width: double.infinity,
                        // height: 150.w,
                        memCacheWidth: 646,
                        memCacheHeight: 315,
                        fit: BoxFit.cover,
                        placeholder: (context, url) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: ColorPath.PrimaryColor.withOpacity(0.1),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return const Icon(Icons.error);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 24.w),
                  if (!controller.isLoad.value)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20).w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.postData.value.title,
                            style: TextPath.Heading2F18W600.copyWith(
                              color: ColorPath.TextGrey1H212121,
                            ),
                          ),
                          SizedBox(height: 4.w),
                          // Text(
                          //   DateFormat('yyyy-MM-dd').format(
                          //     controller.postData.value.created_at,
                          //   ),
                          //   style: TextPath.TextF12W500.copyWith(
                          //     color: ColorPath.TextGrey4H9E9E9E,
                          //   ),
                          // ),
                          SizedBox(height: 12.w),
                          HtmlWidget(
                            controller.postData.value.description,
                            onTapUrl: (String url) async {
                              if (!await launchUrl(Uri.parse(url))) {
                                GlobalToastWidget('일시적으로 링크를 열 수 없습니다');
                              }

                              return false;
                            },
                          ),
                          // Text(
                          //   parse()
                          //       .outerHtml,
                          //   style: TextPath.TextF16W400.copyWith(
                          //     color: ColorPath.TextGrey2H424242,
                          //   ),
                          // ),
                          SizedBox(height: 100.w)
                        ],
                      ),
                    ),
                ],
              ),
            ),
            controller.isLoad.value
                ? const GlobalLoaderIndicatorWidget()
                : controller.isScrollCheck.value
                    ? Positioned(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 50, 3, 0),
                          height: 105.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 100),
                            opacity:
                                controller.isAppBarTitleAnimation.value ? 1 : 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 5,
                                  ).w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(50).w,
                                    // boxShadow: [
                                    //   if (controller.isScrollCheck.value)
                                    //     BoxShadow(
                                    //       color: Colors.grey.withOpacity(0.5),
                                    //       spreadRadius: 1,
                                    //       blurRadius: 1,
                                    //       offset: const Offset(0, 2),
                                    //     ),
                                    // ],
                                  ),
                                  child: GlobalInkWellWidget(
                                    borderRadius: 50.w,
                                    onTap: () async {
                                      Get.back();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 27),
                                Text(
                                  controller.postData.value.title,
                                  style: TextPath.Heading2F18W600.copyWith(
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        top: 60,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5,
                          ).w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50).w,
                            // boxShadow: [
                            //   if (controller.isScrollCheck.value)
                            //     BoxShadow(
                            //       color: Colors.grey.withOpacity(0.5),
                            //       spreadRadius: 1,
                            //       blurRadius: 1,
                            //       offset: const Offset(0, 2),
                            //     ),
                            // ],
                          ),
                          child: GlobalInkWellWidget(
                            borderRadius: 50.w,
                            onTap: () async {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
