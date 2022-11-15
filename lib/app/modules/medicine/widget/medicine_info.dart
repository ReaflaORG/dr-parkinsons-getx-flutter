import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class MedicineInfo extends StatelessWidget {
  const MedicineInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 34.w,
          child: Text(
            '약제명',
            textAlign: TextAlign.left,
            style: TextPath.TextF14W400.copyWith(
                color: ColorPath.TextGrey4H9E9E9E),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '약제명 텍스트',
            style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 34.w,
          child: Text(
            '설명',
            textAlign: TextAlign.left,
            style: TextPath.TextF14W400.copyWith(
                color: ColorPath.TextGrey4H9E9E9E),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '설명텍스트',
            style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 34.w,
          child: Text(
            '부작용',
            textAlign: TextAlign.left,
            style: TextPath.TextF14W400.copyWith(
                color: ColorPath.TextGrey4H9E9E9E),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '부작용 텍스트',
            style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 34.w,
          child: Text(
            '종류',
            textAlign: TextAlign.left,
            style: TextPath.TextF14W400.copyWith(
                color: ColorPath.TextGrey4H9E9E9E),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            '종류 텍스트',
            style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121),
          ),
        ),
      ],
    );
  }
}
