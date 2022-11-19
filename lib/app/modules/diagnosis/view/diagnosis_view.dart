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
  Widget build(BuildContext context) => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(74.w),
          child: AppBar(
            toolbarHeight: 84,
            backgroundColor: ColorPath.SecondaryLightColor,
            leadingWidth: 60,
            leading: Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              child: CircleAvatar(
                backgroundColor: ColorPath.BackgroundWhite,
                radius: 24,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ),
            ),
            centerTitle: false,
            elevation: 0,
            shadowColor: Colors.white,
            title: Text(
              '파킨슨 자가진단',
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                            child: TestInProgressWidget(),
                            // child: Column(
                            //   children: [
                            //     Row(
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         Text(
                            //           '자가진단 테스트 ',
                            //           style: TextPath.TextF16W500.copyWith(
                            //               color: ColorPath.TextGrey2H424242),
                            //         ),
                            //         Text(
                            //           '13 ',
                            //           style: TextPath.TextF16W500.copyWith(
                            //               color: ColorPath.TertiaryColor),
                            //         ),
                            //         Text(
                            //           '/ 20',
                            //           style: TextPath.TextF16W500.copyWith(
                            //               color: ColorPath.TextGrey2H424242),
                            //         ),
                            //       ],
                            //     ),
                            //     SizedBox(
                            //       height: 16.w,
                            //     ),
                            //     SizedBox(
                            //       width: 260,
                            //       child: Text(
                            //         '1. 숙면을 취하기 어렵고 불안하고 예민해진 느낌이 든다.',
                            //         style: TextPath.TextF16W500Expand,
                            //         maxLines: 3,
                            //       ),
                            //     ),
                            //   ],
                            // ),
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
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      // foregroundColor: Colors.deepPurple,
                      // backgroundColor: Colors.amberAccent,
                      textStyle: TextPath.TextF14W400.copyWith(
                          color: ColorPath.TextGrey2H424242),
                      fixedSize: Size(130.w, 44.w),
                    ),
                    child: const Text('뒤로가기'),
                  ),
                  // OutlinedButton(
                  //   onPressed: () {},
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Text(
                  //       '뒤로가기',
                  //       style: TextPath.TextF14W400.copyWith(
                  //           color: ColorPath.TextGrey2H424242),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     width: 130.w,
                  //     alignment: Alignment.center,
                  //     decoration: BoxDecoration(
                  //         color: ColorPath.BackgroundWhite,
                  //         borderRadius: const BorderRadius.all(
                  //           Radius.circular(4),
                  //         ),
                  //         border:
                  //             Border.all(color: ColorPath.PrimaryLightColor)),
                  //     height: 44.w,
                  //     child: Text(
                  //       '뒤로가기',
                  //       style: TextPath.TextF14W400.copyWith(
                  //           color: ColorPath.TextGrey2H424242),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      //change width and height on your need width = 200 and height = 50
                      minimumSize: Size(180.w, 44.w),
                    ),
                    onPressed: () {},
                    child: Text(
                      '다음',
                      style: TextPath.TextF14W400.copyWith(
                          color: ColorPath.TextWhite),
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
            //   child: Row(
            //     children: [
            //       InkWell(
            //         onTap: () {},
            //         child: Container(
            //           width: 130.w,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //               color: ColorPath.BackgroundWhite,
            //               borderRadius: const BorderRadius.all(
            //                 Radius.circular(4),
            //               ),
            //               border:
            //                   Border.all(color: ColorPath.PrimaryLightColor)),
            //           height: 44.w,
            //           child: Text(
            //             '뒤로가기',
            //             style: TextPath.TextF14W400.copyWith(
            //                 color: ColorPath.TextGrey2H424242),
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 10),
            //       InkWell(
            //         onTap: () {},
            //         child: Container(
            //           width: 180.w,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //             color: ColorPath.PrimaryDarkColor,
            //             borderRadius: const BorderRadius.all(
            //               Radius.circular(4),
            //             ),
            //           ),
            //           height: 44.w,
            //           child: Text(
            //             '다음',
            //             style: TextPath.TextF14W400.copyWith(
            //                 color: ColorPath.TextWhite),
            //           ),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      );
}

class TestAfterWidget extends GetView<DiagnosisController> {
  // const TestAfterWigdet({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Text('hello')));
  }
}

class TestInProgressWidget extends GetView<DiagnosisController> {
  // TestAfterWigdet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '자가진단 테스트 ',
              style: TextPath.TextF16W500.copyWith(
                  color: ColorPath.TextGrey2H424242),
            ),
            Text(
              '13 ',
              style:
                  TextPath.TextF16W500.copyWith(color: ColorPath.TertiaryColor),
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
      // ),
    );
  }
}
