import 'package:dr_parkinsons/app/modules/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/healthcare_controller.dart';
import '../widgets/healthcare_mainbtn.dart';

class HealthCareView extends GetView<HealthCareController> {
  const HealthCareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        onWillPop: () => MainController.to.handleBackPressed(),
        appBar: GlobalAppBarWidget(
          title: '건강관리',
          appBar: AppBar(),
          isLeadingVisible: true,
          actions: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: Image.asset(
                  'assets/images/icons/2d/24alert.png',
                ),
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).w,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // 확인 후 수정 예정
                        // Container(
                        //   width: 320.w,
                        //   height: 36.w,
                        //   decoration: BoxDecoration(
                        //     color: ColorPath.Background1HECEFF1,
                        //     borderRadius: BorderRadius.circular(36).r,
                        //   ),
                        //   child: GlobalInkWellWidget(
                        //     borderRadius: 36.r,
                        //     onTap: () {},
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(left: 20).w,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           SizedBox(
                        //             width: 18.w,
                        //             height: 18.w,
                        //             child: Image.asset(
                        //               'assets/images/icons/loud_speaker.webp',
                        //               cacheWidth: 36,
                        //               // cacheHeight: 36,
                        //             ),
                        //           ),
                        //           SizedBox(width: 10.w),
                        //           Text(
                        //             '[복지] 노인장기요양보험 안내',
                        //             style: TextPath.TextF13W400.copyWith(
                        //               color: ColorPath.TextGrey3H616161,
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 18.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10.w,
                              crossAxisSpacing: 10.w,
                              children: List.generate(
                                controller.menuData.length,
                                (index) {
                                  return HealthcareMainbtn(
                                    item: controller.menuData[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ).w,
                decoration: BoxDecoration(
                  color: ColorPath.Background1HECEFF1,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30).r,
                    topRight: const Radius.circular(30).r,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 340.w,
                      padding: const EdgeInsets.only(bottom: 12).w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '복지혜택 보기',
                            style: TextPath.Heading2F18W600.copyWith(
                              color: ColorPath.TextGrey1H212121,
                            ),
                          ),
                          GlobalInkWellWidget(
                            padding: const EdgeInsets.only(left: 10).w,
                            onTap: () {
                              Get.toNamed(Routes.SOCIALWELFARE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '더보기',
                                  style: TextPath.TextF13W400.copyWith(
                                    color: ColorPath.TextGrey3H616161,
                                  ),
                                ),
                                Image.asset(
                                  'assets/images/icons/2d/24arrowright.png',
                                  width: 18.w,
                                  height: 18.w,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        controller.welfareData.length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10).w,
                            child: CardWidget(
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// 카드 위젯
class CardWidget extends GetView<HealthCareController> {
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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8).r,
              child: SizedBox(
                width: double.infinity,
                height: 150.w,
                child: Stack(
                  children: [
                    Image.network(
                      controller.welfareData[index].image,
                      width: double.infinity,
                      cacheWidth: 640,
                      // cacheHeight: 280,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 0,
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
                  ],
                ),
              ),
            ),
            // child: Container(
            //   alignment: Alignment.bottomLeft,
            //   height: 130.w,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         controller.welfareData[index].image,
            //       ),
            //       fit: BoxFit.cover,
            //     ),
            //     borderRadius: BorderRadius.circular(8).r,
            //   ),
            //   child: Container(
            //     margin: const EdgeInsets.all(10).w,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 6,
            //       vertical: 2,
            //     ).w,
            //     decoration: BoxDecoration(
            //       color: ColorPath.PrimaryColor.withOpacity(
            //         0.8,
            //       ),
            //       borderRadius: BorderRadius.circular(4).r,
            //     ),
            //     child: Text(
            //       controller.welfareData[index].title,
            //       style: TextPath.Heading3F16W600.copyWith(
            //         color: ColorPath.TextWhite,
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ),
        SizedBox(height: 10.w),
      ],
    );
  }
}
