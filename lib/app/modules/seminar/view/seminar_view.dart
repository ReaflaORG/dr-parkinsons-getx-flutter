import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/seminar_controller.dart';

class SeminarView extends GetView<SeminarController> {
  const SeminarView({super.key});

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
                    height: 300.w,
                    child: Image.asset(
                      'assets/images/mock/page2/semina 360x242.jpg',
                      cacheWidth: 640,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 24.w),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20).w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 264.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '닥터파킨슨은 파킨슨병 극복을 염원하며 대한 파킨슨병 및 이상운동질환 학회와 질병관리청이 함께 만들었습니다.',
                                style: TextPath.TextF14W400Expand.copyWith(
                                  color: ColorPath.TextGrey2H424242,
                                ),
                              ),
                              Text(
                                style: TextPath.TextF14W400Expand.copyWith(
                                  color: ColorPath.TextGrey2H424242,
                                ),
                                '닥터파킨슨은 파킨슨병 환자와 보호자에게 파킨슨병에 대한 제대로 된 정보를 다양한 컨텐츠를 통해 제공하고, 파킨슨병 환자의 건강관리를 도모하여 내 손안의 주치의 역할을 하고자 합니다.',
                              ),
                              Text(
                                style: TextPath.TextF14W400Expand.copyWith(
                                  color: ColorPath.TextGrey2H424242,
                                ),
                                '또한 일반인에게는 파킨슨병에 대한 올바른 정보 제공을 통해 파킨슨병의 인지도를 개선하고, 파킨슨병의 조기진단에 기여하고자 합니다.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 80.w)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        'assets/images/logo/logo3.webp',
                        fit: BoxFit.cover,
                        width: 140.w,
                      ),
                      Image.asset(
                        'assets/images/logo/logo2.webp',
                        fit: BoxFit.cover,
                        width: 130.w,
                      )
                    ],
                  ),
                  SizedBox(height: 20.w)
                ],
              ),
            ),
            controller.isScrollCheck.value
                ? AnimatedOpacity(
                    duration: const Duration(milliseconds: 100),
                    opacity: controller.isAppBarTitleAnimation.value ? 1 : 0,
                    child: Positioned(
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
                            Expanded(
                              child: Text(
                                '학회 및 앱 소개',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextPath.Heading2F18W600.copyWith(
                                  color: ColorPath.TextGrey1H212121,
                                ),
                              ),
                            ),
                            SizedBox(width: 20.w),
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

    // @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     body: SafeArea(
    //       child: SingleChildScrollView(
    //         physics: const AlwaysScrollableScrollPhysics(),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Stack(
    //               children: [
    //                 Container(
    //                   padding: EdgeInsets.symmetric(
    //                     horizontal: 10.w,
    //                     vertical: 8.w,
    //                   ),
    //                   width: double.infinity,
    //                   height: 242.w,
    //                   decoration: const BoxDecoration(
    //                     image: DecorationImage(
    //                       image: AssetImage(
    //                         'assets/images/mock/page2/semina 360x242.jpg',
    //                       ),
    //                       fit: BoxFit.cover,
    //                     ),
    //                   ),
    //                 ),
    //                 Positioned(
    //                   left: 20.w,
    //                   top: 12.w,
    //                   child: InkWell(
    //                     onTap: () => Get.back(),
    //                     child: SizedBox(
    //                       width: 36.w,
    //                       height: 36.w,
    //                       child: CircleAvatar(
    //                         backgroundColor: Colors.white,
    //                         child: Icon(
    //                           Icons.arrow_back,
    //                           size: 24.w,
    //                           color: ColorPath.TextGrey1H212121,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             SizedBox(height: 24.w),
    //             Container(
    //               margin: EdgeInsets.symmetric(horizontal: 20.5.w),
    //               child: Column(
    //                 children: [
    //                   Text(
    //                     '닥터 파킨슨 소개',
    //                     style: TextPath.Heading2F18W600.copyWith(
    //                         color: ColorPath.TextGrey1H212121),
    //                   ),
    //                   SizedBox(height: 12.w),
    //                   SizedBox(
    //                     height: 264.w,
    //                     child: Column(
    //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                       children: [
    //                         Text(
    //                           '닥터파킨슨은 파킨슨병 극복을 염원하며 대한 파킨슨병 및 이상운동질환 학회와 질병관리청이 함께 만들었습니다.',
    //                           style: TextPath.TextF14W400Expand.copyWith(
    //                             color: ColorPath.TextGrey2H424242,
    //                           ),
    //                         ),
    //                         Text(
    //                           style: TextPath.TextF14W400Expand.copyWith(
    //                             color: ColorPath.TextGrey2H424242,
    //                           ),
    //                           '닥터파킨슨은 파킨슨병 환자와 보호자에게 파킨슨병에 대한 제대로 된 정보를 다양한 컨텐츠를 통해 제공하고, 파킨슨병 환자의 건강관리를 도모하여 내 손안의 주치의 역할을 하고자 합니다.',
    //                         ),
    //                         Text(
    //                           style: TextPath.TextF14W400Expand.copyWith(
    //                             color: ColorPath.TextGrey2H424242,
    //                           ),
    //                           '또한 일반인에게는 파킨슨병에 대한 올바른 정보 제공을 통해 파킨슨병에 인지를 개선하고, 파킨슨병의 조기진단에 기여하고자 합니다.',
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   );
  }
}
