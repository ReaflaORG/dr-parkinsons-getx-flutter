import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/diagnosis_survey_model.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class DiagnosisAnswer extends StatelessWidget {
  final Function handleSelectItem; // * 클릭햇을 떄 변환해주는 함수
  final bool isPicked; // * 현재 선택된 값
  final Answer answer;
  const DiagnosisAnswer(
      {super.key,
      required this.handleSelectItem,
      required this.isPicked,
      required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      margin: EdgeInsets.only(bottom: 10.w),
      child: InkWell(
        onTap: () => handleSelectItem(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
          width: 300.w,
          decoration: BoxDecoration(
              border: Border.all(color: ColorPath.PrimaryLightColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              color: isPicked ? ColorPath.PrimaryLightColor : Colors.white),
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
                        : Image.asset('assets/images/icons/2d/24false.png')),
              ),
              Expanded(
                  child: Text(
                answer.answerText,
                style: TextPath.TextF16W500.copyWith(
                  color: ColorPath.TextGrey2H424242,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
