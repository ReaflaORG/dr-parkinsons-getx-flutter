import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/socialwelfarepost_controller.dart';

class SocialWelfarePostView extends GetView<SocialWelfarePostController> {
  const SocialWelfarePostView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => SafeArea(
          child: Scaffold(
              body: controller.process.value == false
                  ? SingleChildScrollView(
                      child: Column(children: [
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
                                      controller.postData.value.image),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(16)),
                          ),
                          Positioned(
                            left: 20,
                            top: 12,
                            child: InkWell(
                              onTap: () => Get.back(),
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
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.postData.value.title,
                                style: TextPath.Heading2F18W600.copyWith(
                                    color: ColorPath.TextGrey1H212121),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                DateFormat('yyyy-MM-dd').format(
                                    controller.postData.value.created_at),
                                style: TextPath.TextF12W500.copyWith(
                                    color: ColorPath.TextGrey4H9E9E9E),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                height: 504.w,
                                child: Column(
                                  children: [
                                    Text(
                                      controller.postData.value.description,
                                      style: TextPath.TextF16W400.copyWith(
                                          color: ColorPath.TextGrey2H424242),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 91)
                            ],
                          ),
                        ),
                      ]),
                    )
                  : const SizedBox.shrink()),
        ),
      );
}
