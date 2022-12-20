import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_loader_indicator_widget.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/fact_detail_controller.dart';

/// 오해와 진실 상세 페이지
class FactDetailView extends GetView<FactDetailController> {
  const FactDetailView({super.key});

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
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 8.w,
                          ),
                          width: double.infinity,
                          height: 242.w,
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
                          left: 20.w,
                          top: 12.w,
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
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                            SizedBox(height: 4.w),
                            Text(
                              controller.postData.value!.created_at
                                  .substring(0, 10),
                              style: TextPath.TextF12W500.copyWith(
                                color: ColorPath.TextGrey4H9E9E9E,
                              ),
                            ),
                            SizedBox(height: 12.w),
                            SizedBox(
                              height: 504.w,
                              child: Column(
                                children: [
                                  Text(
                                    controller.postData.value!.description,
                                    style: TextPath.TextF14W400Expand.copyWith(
                                      color: ColorPath.TextGrey2H424242,
                                    ),
                                  ),
                                ],
                              ),
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
