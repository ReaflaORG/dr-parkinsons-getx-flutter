import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/diagnosis_survey_model.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';

/// * DiagnosisAnswer
///
/// [handleSelectItem] Function : 클릭햇을 떄 변환해주는 함수
///
/// [isPicked] bool : 현재 선택된 값
///
/// [answer] Answer : 선택지
///
/// [isPass] bool : 문제의 통과 여부
class DiagnosisAnswer extends StatelessWidget {
  const DiagnosisAnswer({
    super.key,
    required this.handleSelectItem,
    required this.isPicked,
    required this.isPass,
    required this.answer,
  });

  final Function handleSelectItem;
  final bool isPicked;
  final bool isPass;
  final AnswerModel answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20).w,
      margin: const EdgeInsets.only(bottom: 10).w,
      child: InkWell(
        onTap: () => handleSelectItem(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ).w,
          width: 300.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: ColorPath.PrimaryLightColor,
            ),
            borderRadius: BorderRadius.all(
              const Radius.circular(8).r,
            ),
            color: isPicked ? ColorPath.PrimaryLightColor : Colors.white,
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: 40.w,
                child: SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: isPicked
                      ? Image.asset('assets/images/icons/2d/24true.png')
                      : Image.asset('assets/images/icons/2d/24false.png'),
                ),
              ),
              Expanded(
                child: Text(
                  answer.answerText,
                  style: TextPath.TextF16W500.copyWith(
                    color: ColorPath.TextGrey2H424242,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
