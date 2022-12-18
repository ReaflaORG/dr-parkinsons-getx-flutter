import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/socialwelfare_controller.dart';

class SocialWelfareView extends GetView<SocialWelfareController> {
  const SocialWelfareView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              elevation: 0,
              shadowColor: Colors.white,
              title: Text(
                '파킨슨 사회복지제도',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
              backgroundColor: Colors.white,
            ),
            floatingActionButton: SizedBox(
              width: 110.w,
              height: 30.w,
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorPath.PrimaryDarkColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Text(
                    '+ 정책제안',
                    style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.BackgroundWhite,
                    ),
                  ),
                ),
                // backgroundColor: ColorPath.PrimaryDarkColor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterFloat,
            body: controller.process.value == false
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          ...List.generate(
                            controller.welfareDatas.length,
                            (index) => Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                        '/socialwelfare/socialwelfarepost',
                                        arguments: {
                                          'id': controller
                                              .welfareDatas[index].welfare_id
                                        });
                                  },
                                  child: Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(
                                      left: 16,
                                      bottom: 8,
                                    ),
                                    width: 320.w,
                                    height: 130.w,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(controller
                                              .welfareDatas[index].image),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          color: ColorPath.SecondaryLightColor,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                controller.welfareDatas[index]
                                                    .created_at),
                                            style:
                                                TextPath.TextF13W500.copyWith(
                                                    color: ColorPath
                                                        .TextGrey3H616161),
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          color: ColorPath.SecondaryColor
                                              .withOpacity(0.8),
                                          child: Text(
                                            controller
                                                .welfareDatas[index].title,
                                            style: TextPath.Heading3F16W600
                                                .copyWith(
                                              color: ColorPath.BackgroundWhite,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink()),
      );
}
