import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../globals/global_loader_indicator_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/social_welfare_detail_controller.dart';

/// 사회복지제도 상세 페이지
class SocialWelfareDetailView extends GetView<SocialWelfareDetailController> {
  const SocialWelfareDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoad.value
          ? const GlobalLoaderIndicatorWidget()
          : Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          width: double.infinity,
                          height: 242,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                controller.postData.value!.image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 12,
                          child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SizedBox(
                              width: 36.w,
                              height: 36.w,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                  color: ColorPath.TextGrey1H212121,
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                      SizedBox(height: 24.w),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.postData.value!.title,
                              style: TextPath.Heading2F18W600.copyWith(
                                  color: ColorPath.TextGrey1H212121),
                            ),
                            SizedBox(height: 4.w),
                            Text(
                              DateFormat('yyyy-MM-dd').format(
                                controller.postData.value!.created_at,
                              ),
                              style: TextPath.TextF12W500.copyWith(
                                color: ColorPath.TextGrey4H9E9E9E,
                              ),
                            ),
                            SizedBox(height: 12.w),
                            Column(
                              children: [
                                Text(
                                  controller.postData.value!.description,
                                  style: TextPath.TextF16W400.copyWith(
                                      color: ColorPath.TextGrey2H424242),
                                ),
                              ],
                            ),
                            SizedBox(height: 91.w)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
