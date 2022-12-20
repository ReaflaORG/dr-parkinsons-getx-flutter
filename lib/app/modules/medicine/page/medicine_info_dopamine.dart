import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

/// 도파민제 약제 설명 페이지
class MedicineInfoDopaminePage extends StatelessWidget {
  const MedicineInfoDopaminePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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
            '도파민제',
            style: TextPath.TextF14W400Expand.copyWith(
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
            '''
  파킨슨병은 도파민의 부족 혹은 결핍으로 인해 발생하는 질환으로 파킨슨병에 대한 치료제는 이 부족한 도파민을 보충해주는 것으로 도파민제는 가장 근간이 되는 파킨슨 치료제이다. 약물이 뇌 속으로 들어가기위한 혈액뇌장벽을 통과해야 하는데 도파민은 통과가 되지 않으므로 도파민으로 만들어지기 전 단계의 물질인 전구체, 레보도파를 복용한다. 레보도파는 파킨슨 치료 약물중 가장 운동 개선 효과가 뛰어나며 부작용이 적다.

  레보도파가 뇌에 도달하기전에 도파민으로 활성화 되는 것을 막기위해서 방향족 L-아미노산 탈카복실화효소 (Aromatic L-amino acid decarboxylase, DOPA decarboxylase)를 억제하는 카르비도파, 벤세라지드와 같은 DOPA decarboxylase inhibitor 를 결합해서 복용하도록 한다.''',
            style: TextPath.TextF14W400Expand.copyWith(
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
            '''  오심, 구토, 어지러움, 식욕부진, 환각, 망상, 기립성 저혈압, 졸림, 이상운동증, 도파민 조절장애, 충동조절장애 등''',
            style: TextPath.TextF14W400Expand.copyWith(
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
          height: 30.w,
          child: Text(
            '1.1. 레보도파 일반형',
            style: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey1H212121),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            ''' 소장상부에서 흡수되어 복용 1시간후 최고 혈중농도 도달한다. 신속한 작용을 위해서 가능하다면 식전 30분~ 1시간 또는 식후 1-2시간후 복용 권장한다. 
''',
            style: TextPath.TextF14W400Expand.copyWith(
                color: ColorPath.TextGrey1H212121),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 6.w),
          height: 30.w,
          child: Text(
            '퍼킨슨 일반정',
            style: TextPath.TextF14W500.copyWith(
                color: ColorPath.PrimaryDarkColor),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 6.w),
          child: Image.asset(
            'assets/images/medicine/pill0101.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * .35,
            // height: 70.w,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 12.w),
          child: Text(
            '''레보도파 100mg, 카르비도파수화물 27mg''',
            style: TextPath.TextF13W400.copyWith(
                color: ColorPath.TextGrey2H424242),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 6.w),
          child: Image.asset(
            'assets/images/medicine/pill0102.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * .35,
            // height: 70.w,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 12.w),
          child: Text(
            '''레보도파 250mg, 카르비도파수화물 27mg''',
            style: TextPath.TextF13W400.copyWith(
                color: ColorPath.TextGrey2H424242),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 30.w,
          child: Text(
            '명도파 일반정',
            style: TextPath.TextF14W500.copyWith(
                color: ColorPath.PrimaryDarkColor),
          ),
        ),

        // 약제 3번
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 6.w),
          child: Image.asset(
            'assets/images/medicine/pill0103.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * .35,
            // height: 70.w,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 12.w),
          child: Text(
            '''레보도파 100mg, 벤세라지드염산염 28.5mg''',
            style: TextPath.TextF13W400.copyWith(
                color: ColorPath.TextGrey2H424242),
          ),
        ),

        // 약제 4번
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 6.w),
          child: Image.asset(
            'assets/images/medicine/pill0104.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width * .35,
            // height: 70.w,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(bottom: 12.w),
          child: Text(
            '''레보도파 100mg, 벤세라지드염산염 28.5mg''',
            style: TextPath.TextF13W400.copyWith(
                color: ColorPath.TextGrey2H424242),
          ),
        ),
      ],
    );
  }
}
