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
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
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

// class TestAfterWidget extends GetView<DiagnosisController> {
//   @override
//   Widget build(BuildContext context) {
//     return Text('Test Finished');
//   }
// }

class TestInProgressWidget extends GetView<DiagnosisController> {
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
                "${controller.questionNumber.value + 1} ",
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
            width: 260,
            child: Text(
              controller.survey.value.quizes[controller.questionNumber.value]
                  .questionText,
              style: TextPath.TextF16W500Expand,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}

// * 설문 진행화면
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
                                  offset: const Offset(
                                      5, 5), // changes position of shadow
                                ),
                              ],
                              color: ColorPath.BackgroundWhite,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: TestInProgressWidget()),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 54.w,
                  ),
                  ...List.generate(
                      controller
                          .survey
                          .value
                          .quizes[controller.questionNumber.value]
                          .answers
                          .length, (index) {
                    return DiagnosisAnswer(
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
                            .answers[index]);
                  }).toList()
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
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
                  child: const Text('뒤로가기'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    //change width and height on your need width = 200 and height = 50
                    minimumSize: Size(180.w, 44.w),
                  ),
                  onPressed: () => controller.nextQuestion(),
                  child: Text(
                    '다음',
                    style: TextPath.TextF14W400.copyWith(
                        color: ColorPath.TextWhite),
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

// * 결과 페이지
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
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 60.w, vertical: 26.w),
                          width: 320.w,
                          height: 437.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorPath.PrimaryColor.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    5, 5), // changes position of shadow
                              ),
                            ],
                            color: ColorPath.BackgroundWhite,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '진단결과',
                                  style: TextPath.Heading1F24W600,
                                ),
                                const SizedBox(
                                  height: 34,
                                ),
                                Text('''김하나 님의 점수는 40점으로 
파킨슨 질병 의심환자 입니다. 
전문의 검진 및 상담이 필요합니다.''',
                                    style: TextPath.TextF16W500Expand.copyWith(
                                        color: ColorPath.TextGrey2H424242)),
                                SizedBox(
                                  height: 34.w,
                                ),
                                Text(
                                  '''전문의와의 상담을 원하시면, 
하단의 링크를 눌러주세요.''',
                                  style: TextPath.TextF14W400.copyWith(
                                      color: ColorPath.TextGrey2H424242),
                                ),
                                SizedBox(
                                  height: 34.w,
                                ),
                                InkWell(
                                  onTap: () => Get.toNamed('/search'),
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 6.w),
                                    height: 60.w,
                                    width: 210.w,
                                    decoration: BoxDecoration(
                                      color: ColorPath.PrimaryLightColor,
                                      borderRadius: BorderRadius.circular(16.w),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorPath.PrimaryColor
                                              .withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 20,
                                          offset: const Offset(5,
                                              5), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor:
                                              ColorPath.BackgroundWhite,
                                          radius: 24,
                                          child: IconButton(
                                            onPressed: () => Get.back(),
                                            icon: Image.asset(
                                                'assets/images/icons/3d/28stethoscope.png'),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 14.w,
                                        ),
                                        Text(
                                          '''파킨슨 전문의 찾기 
바로가기''',
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
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.w),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                //change width and height on your need width = 200 and height = 50
                minimumSize: Size(320.w, 44.w),
              ),
              // onPressed: () => controller.nextQuestion(),
              onPressed: () => Get.back(),
              child: Text(
                '확인',
                style:
                    TextPath.TextF14W400.copyWith(color: ColorPath.TextWhite),
              ),
            )),
      ],
    );
  }
}
