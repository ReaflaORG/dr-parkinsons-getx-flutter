import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/diagnosis_controller.dart';
import '../widget/diagnosis_answer.dart';

class DiagnosisView extends GetView<DiagnosisController> {
  const DiagnosisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(74.w),
          child: AppBar(
            toolbarHeight: 84.w,
            backgroundColor: ColorPath.SecondaryLightColor,
            leadingWidth: 60.w,
            leading: Container(
              margin: const EdgeInsets.only(
                left: 20,
              ).w,
              child: CircleAvatar(
                backgroundColor: ColorPath.BackgroundWhite,
                radius: 24.r,
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
              controller.survey.value.nameOfSurvey,
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ),
        ),
        body: controller.isFinish.value
            ? const SurveyResultView()
            : const SurveyTestingView(),
      ),
    );
  }
}

class TestInProgressWidget extends GetView<DiagnosisController> {
  const TestInProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '???????????? ????????? ',
                style: TextPath.TextF16W500.copyWith(
                    color: ColorPath.TextGrey2H424242),
              ),
              Text(
                '${controller.questionNumber.value + 1} ',
                style: TextPath.TextF16W500.copyWith(
                    color: ColorPath.TertiaryColor),
              ),
              Text(
                '/ ${controller.survey.value.quizes.length}',
                style: TextPath.TextF16W500.copyWith(
                    color: ColorPath.TextGrey2H424242),
              ),
            ],
          ),
          SizedBox(
            height: 16.w,
          ),
          SizedBox(
            width: 260.w,
            child: Text(
              controller.survey.value.quizes[controller.questionNumber.value]
                  .questionText,
              maxLines: 3,
              style: TextPath.TextF16W500Expand,
            ),
          ),
        ],
      ),
    );
  }
}

/// ?????? ????????????
class SurveyTestingView extends GetView<DiagnosisController> {
  const SurveyTestingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
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
                            ).r,
                          ),
                        ),
                      ),
                      Positioned(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 26,
                          ).w,
                          width: 320.w,
                          height: 180.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorPath.PrimaryColor.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(5, 5),
                              ),
                            ],
                            color: ColorPath.BackgroundWhite,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ).r,
                          ),
                          child: const TestInProgressWidget(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 54.w),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.survey.value
                        .quizes[controller.questionNumber.value].answers.length,
                    itemBuilder: (context, index) {
                      return DiagnosisAnswer(
                        isPass: controller.survey.value
                            .quizes[controller.questionNumber.value].isPass,
                        handleSelectItem: () =>
                            controller.handlePickUserAnswer(index),
                        isPicked: controller
                                .survey
                                .value
                                .quizes[controller.questionNumber.value]
                                .userAnswer ==
                            index,
                        answer: controller
                            .survey
                            .value
                            .quizes[controller.questionNumber.value]
                            .answers[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ).w,
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: () => controller.prevQuestion(),
                  style: OutlinedButton.styleFrom(
                    // foregroundColor: Colors.deepPurple,
                    // backgroundColor: Colors.amberAccent,
                    textStyle: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextGrey2H424242),
                    fixedSize: Size(130.w, 44.w),
                  ),
                  child: const Text('????????????'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(180.w, 44.w),
                  ),
                  onPressed: () => controller.nextQuestion(),
                  child: Text(
                    '??????',
                    style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ?????? ?????????
class SurveyResultView extends GetView<DiagnosisController> {
  const SurveyResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                        height: 226.w,
                        decoration: BoxDecoration(
                          color: ColorPath.SecondaryLightColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36),
                            bottomRight: Radius.circular(36),
                          ).r,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 26,
                        ).w,
                        width: 320.w,
                        height: 437.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: ColorPath.PrimaryColor.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(5, 5),
                            ),
                          ],
                          color: ColorPath.BackgroundWhite,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ).r,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '????????????',
                              style: TextPath.Heading1F24W600,
                            ),
                            SizedBox(height: 34.w),
                            Text(
                              controller.handleResultValue(),
                              style: TextPath.TextF16W500Expand.copyWith(
                                color: ColorPath.TextGrey2H424242,
                              ),
                            ),
                            SizedBox(height: 34.w),
                            Text(
                              '''??????????????? ????????? ????????????,\n????????? ????????? ???????????????.''',
                              style: TextPath.TextF14W400.copyWith(
                                  color: ColorPath.TextGrey2H424242),
                            ),
                            SizedBox(height: 34.w),
                            InkWell(
                              onTap: () => Get.toNamed('/search'),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6).w,
                                height: 60.w,
                                width: 210.w,
                                decoration: BoxDecoration(
                                  color: ColorPath.PrimaryLightColor,
                                  borderRadius: BorderRadius.circular(16).r,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorPath.PrimaryColor.withOpacity(
                                        0.1,
                                      ),
                                      spreadRadius: 2,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          ColorPath.BackgroundWhite,
                                      radius: 24,
                                      child: IconButton(
                                        onPressed: () => Get.back(),
                                        icon: Image.asset(
                                          'assets/images/icons/3d/28stethoscope.png',
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 14.w),
                                    Text(
                                      '''????????? ????????? ?????? 
????????????''',
                                      textAlign: TextAlign.center,
                                      style: TextPath.TextF14W500.copyWith(
                                        color: ColorPath.TextGrey2H424242,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ).w,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(320.w, 44.w),
            ),
            onPressed: () => Get.back(),
            child: Text(
              '??????',
              style: TextPath.TextF14W400.copyWith(color: ColorPath.TextWhite),
            ),
          ),
        ),
      ],
    );
  }
}
