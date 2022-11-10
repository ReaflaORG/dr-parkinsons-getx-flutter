import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/diagnosis_controller.dart';
import '../widget/diagnosis_answer.dart';

class DiagnosisView extends GetView<DiagnosisController> {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 74.w,
                        decoration:
                            BoxDecoration(color: ColorPath.SecondaryLightColor),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 36.w, //안먹히네
                                width: 36.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: ColorPath.BackgroundWhite,
                                ),
                                child: IconButton(
                                  onPressed: () => Get.back(),
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: ColorPath.TextGrey1H212121,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              '파킨슨 자가진단',
                              style: TextPath.Heading2F18W600.copyWith(
                                  color: ColorPath.TextGrey1H212121),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            child: Container(
                              height: 76.w,
                              decoration: BoxDecoration(
                                color: ColorPath.SecondaryLightColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(36),
                                  bottomRight: Radius.circular(36),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 28.w, vertical: 26.w),
                              width: 320.w,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        ColorPath.PrimaryColor.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(
                                        5, 5), // changes position of shadow
                                  ),
                                ],
                                color: ColorPath.BackgroundWhite,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '자가진단 테스트 ',
                                        style: TextPath.TextF16W500.copyWith(
                                            color: ColorPath.TextGrey2H424242),
                                      ),
                                      Text(
                                        '13 ',
                                        style: TextPath.TextF16W500.copyWith(
                                            color: ColorPath.TertiaryColor),
                                      ),
                                      Text(
                                        '/ 20',
                                        style: TextPath.TextF16W500.copyWith(
                                            color: ColorPath.TextGrey2H424242),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 16.w,
                                  ),
                                  SizedBox(
                                    width: 260,
                                    child: Text(
                                      '1. 숙면을 취하기 어렵고 불안하고 예민해진 느낌이 든다.',
                                      style: TextPath.TextF16W500Expand,
                                      maxLines: 3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 54.w,
                      ),
                      const DiagnosisAnswer(),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 130.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: ColorPath.BackgroundWhite,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                            border:
                                Border.all(color: ColorPath.PrimaryLightColor)),
                        height: 44.w,
                        child: Text(
                          '뒤로가기',
                          style: TextPath.TextF14W400.copyWith(
                              color: ColorPath.TextGrey2H424242),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 180.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorPath.PrimaryDarkColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        height: 44.w,
                        child: Text(
                          '다음',
                          style: TextPath.TextF14W400.copyWith(
                              color: ColorPath.TextWhite),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
