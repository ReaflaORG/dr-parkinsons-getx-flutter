import 'package:base/app/modules/medicine/widget/medicine_item.dart';
import 'package:flutter/material.dart';

/// 복합제 약제 설명 페이지
class MedicineInfoComplexPage extends StatelessWidget {
  const MedicineInfoComplexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        MedicineItemTitle(text: '약제명'),
        MedicineItemDescription(
          text: '''레보도파 엔타카픈 복합제''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitle(text: '설명'),
        MedicineItemDescription(
          text:
              '''레보도파/도파탈탄산효소(Dopadecarboxylase) 억제제 표준치료제로 개선되지 않는 파킨슨병 환자의 운동 동요증상의 치료제로 쓰이며 약효소진 증상의 호전과 악화된 파킨슨 증상을 감소 시킬 수 있다.''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitle(text: '부작용'),
        MedicineItemDescription(
          text: '''구토, 설사, 혼돈, 환각, 비정상적인 꿈, 색뇨증, 빈혈, 식욕감퇴, 이상운동증 등''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitle(text: '종류'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0201.jpg',
          text: '''레보도파/카르비도파/엔타카폰 50/12.5/200''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0202.jpg',
          text: '''레보도파/카르비도파/엔타카폰 75/18.75/200''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0203.jpg',
          text: '''레보도파/카르비도파/엔타카폰 100/25/200''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0204.jpg',
          text: '''레보도파/카르비도파/엔타카폰 125/31.25/200''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0205.jpg',
          text: '''레보도파/카르비도파/엔타카폰 150/37.7/200''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0206.jpg',
          text: '''레보도파/카르비도파/엔타카폰 200/50/200''',
        ),
        MedicineImageItem(
          text: '''스타레보필름코팅정– 알보젠코리아''',
        ),
        MedicineImageItem(
          text: '''트리도파정 – 제일약품''',
        ),
        MedicineImageItem(
          text: '''이지레보- 일화''',
        ),
        MedicineImageItem(
          text: '''트리레보정 – 명인제약''',
        ),
      ],
    );
  }
}
