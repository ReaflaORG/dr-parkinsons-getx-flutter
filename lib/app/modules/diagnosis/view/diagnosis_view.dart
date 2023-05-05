import 'package:dr_parkinsons/app/globals/global_inkwell_widget.dart';
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
                '자가진단 테스트 ',
                style: TextPath.TextF16W500.copyWith(
                    color: ColorPath.TextGrey2H424242),
              ),
              Text(
                '${controller.questionNumber.value + 1} ',
                style: TextPath.TextF16W500.copyWith(
                    color: ColorPath.TertiaryColor),
              ),
              // 3번 수면장애진단에서 6번 항목은 리스트에서 제외되어 -1 처리
              Text(
                // '/ ${controller.survey_id.value != 3 ? controller.survey.value.quizes.length : controller.survey.value.quizes.length - 1}',
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
              textAlign: TextAlign.center,
              style: TextPath.TextF16W500Expand,
            ),
          ),
          if (controller.survey.value.quizes[controller.questionNumber.value]
                  .questionSubText !=
              null)
            SizedBox(
              width: 260.w,
              child: Text(
                controller.survey.value.quizes[controller.questionNumber.value]
                    .questionSubText!,
                textAlign: TextAlign.center,
                style: TextPath.TextF14W400.copyWith(
                  color: ColorPath.TextGrey2H424242,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// 설문 진행화면
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
                          // height: 180.w,
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
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0).w,
            child: Row(
              children: [
                OutlinedButton(
                  onPressed: controller.questionNumber.value > 0
                      ? () => controller.prevQuestion()
                      : null,
                  style: OutlinedButton.styleFrom(
                    disabledBackgroundColor: Colors.grey.shade200,
                    textStyle: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextGrey2H424242,
                    ),
                    fixedSize: Size(130.w, 44.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                  child: Text(
                    '뒤로가기',
                    style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.GreyDarkColor,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(180.w, 44.w),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                  onPressed: () => controller.nextQuestion(),
                  child: Text(
                    '다음',
                    style: TextPath.TextF14W600.copyWith(
                      color: ColorPath.TextWhite,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20).w,
            width: double.infinity,
            child: Text(
              controller.survey_id.value == 2
                  ? '출처 : J Korean Neuropsychiatr Assoc. 1999 Jan;38(1):48-63 Validation of Geriatric Depression Scale, Korean Version(GDS) in the Assessment of DSM-III-R Major Depression'
                  : '출처 : J Clin Sleep Med. 2017 Dec 15; 13(12): 1429–1433.',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: ColorPath.TextGrey4H9E9E9E,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 결과 페이지
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
                          horizontal: 40,
                          vertical: 26,
                        ).w,
                        width: double.infinity,
                        height: 437.w,
                        decoration: BoxDecoration(
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: ColorPath.PrimaryColor.withOpacity(0.1),
                          //     spreadRadius: 2,
                          //     blurRadius: 10,
                          //     offset: const Offset(5, 5),
                          //   ),
                          // ],
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
                              '진단결과',
                              style: TextPath.Heading1F24W600,
                            ),
                            SizedBox(height: 34.w),
                            Text(
                              controller.handleResultValue(),
                              textAlign: TextAlign.center,
                              style: TextPath.TextF16W500Expand.copyWith(
                                color: ColorPath.TextGrey2H424242,
                              ),
                            ),
                            SizedBox(height: 34.w),
                            Text(
                              '전문의와의 상담을 원하시면,\r\n하단의 링크를 눌러주세요.',
                              textAlign: TextAlign.center,
                              style: TextPath.TextF14W400.copyWith(
                                  color: ColorPath.TextGrey2H424242),
                            ),
                            SizedBox(height: 34.w),
                            GlobalInkWellWidget(
                              onTap: () => Get.toNamed('/search'),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 6,
                                ).w,
                                // width: 220.w,
                                height: 60.w,
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
                                      '파킨슨 전문의 찾기',
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10).r,
              ),
            ),
            onPressed: () => Get.back(),
            child: Text(
              '확인',
              style: TextPath.TextF14W600.copyWith(
                color: ColorPath.TextWhite,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
