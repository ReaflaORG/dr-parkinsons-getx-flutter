import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../widget/medicine_item.dart';

/// 콤트억제제 약제 설명 페이지
class MedicineInfoComptInhibitorPage extends StatelessWidget {
  const MedicineInfoComptInhibitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        MedicineItemTitle(text: '약제명'),
        MedicineItemDescription(
          text: '''콤트억제제 (COMT inhibitor)''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitle(text: '설명'),
        MedicineItemDescription(
          text:
              '''콤트억제제는 콤트라는 말초에서 도파민을 분해하는 효소를 차단해서 레보도파의 혈중농도를 더 높게 유지 할 수 있게 하는 약제로, 레보도파의 이용률을 증가시시키고 지속시간을 증가시킨다. 레보도파/도파탈탄산효소(Dopadecarboxylase) 억제제 표준치료제로 개선되지 않는 파킨슨병 환자의 운동 동요증상의 치료제로 쓰이며 약효소진 증상의 호전과 악화된 파킨슨 증상을 감소 시킬 수 있다. 현재 국내에서 처방가능한 콤트억제제는 엔타카폰과 오피카폰 두가지 제제이다. ''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitle(text: '부작용'),
        MedicineItemDescription(
          text: '''구토, 설사, 혼돈, 환각, 비정상적인 꿈, 색뇨증, 빈혈, 식욕감퇴, 이상운동증 ''',
        ),
        SizedBox(height: 20),
        MedicineItemTitle(text: '종류'),
        MedicineItemLabel1(text: '1. 엔타카폰'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0401.jpg',
          text: '''콤탄정 200mg ''',
        ),
        MedicineImageItem(text: '''콤탄정 200mg – 알보젠코리아 '''),
        MedicineImageItem(text: '''엔타폰정 200mg – 삼일제약'''),
        MedicineImageItem(text: '''명인엔타카폰정 200mg – 명인제약 '''),
        MedicineItemLabel1(text: '2. 오피카폰'),
        MedicineItemDescription(
          text:
              '''오피카폰은 기존의 엔타카폰이 가지고 있는 부작용인 설사와 소변색깔 변화의 부작용이 개선된 장점이 있고, 콤탄이 매 도파민 복용시 같이 복용하는 약제라면 온젠티스는 하루 한번 복용한다는 장점''',
        ),
        SizedBox(height: 5),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0402.jpg',
          text: '''온젠티스 50mg''',
        ),
      ],
    );
  }
}
