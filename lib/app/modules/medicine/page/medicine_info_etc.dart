import 'package:flutter/material.dart';

import '../widget/medicine_item.dart';

/// 도파민제 약제 설명 페이지
class MedicineInfoEtcPage extends StatelessWidget {
  const MedicineInfoEtcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        // 약재 1
        MedicineItemTitleWidget(text: '약제명'),
        MedicineItemDescriptionWidget(
          text: '''아만타딘''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '설명'),
        MedicineItemDescriptionWidget(
          text:
              '''아만타딘은 항바이러스제제로 파킨슨병 환자의 증상을 개선시킨다는 것이 점차 알려저 항파킨슨제로 사용되고 있다. 아만타딘은 여러 수용체에 작용하는 약제로 항콜린 효과와 더불어 항글루타메이트 효과가 있어서 이상운동증을 조절하는데 유용하다.  ''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '부작용'),
        MedicineItemDescriptionWidget(
          text: '''입마름, 변비, 시야흐림, 소변장애, 인지장애, 환시, 그물울혈반, 하지 부종 등  ''',
        ),
        SizedBox(height: 20),
        MedicineItemTitleWidget(text: '종류'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0601.jpg',
          text: '''피케이멜즈정 100mg  - 한화제약''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0602.jpg',
          text: '''아만타정 100mg  - 고려제약''',
        ),
        SizedBox(
          height: 20,
        ),
        // 약재 2
        MedicineItemTitleWidget(text: '약제명'),
        MedicineItemDescriptionWidget(
          text: '''항콜린제제''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '설명'),
        MedicineItemDescriptionWidget(
          text:
              '''항콜린제는 도파민의 감소에 인해 상태적으로 증가된 아세틸콜린의 작용을 억제하는 약물로 파킨슨 증상중에서 주로 떨림에 효과가 좋다. 부작용이 많아서 고령의 환자나 인지장애가 있는 환자는 주의가 요한다. ''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '부작용'),
        MedicineItemDescriptionWidget(
          text: '''입마름, 변비, 시야흐림, 소변장애, 인지장애, 환시 등 ''',
        ),
        SizedBox(height: 20),
        MedicineItemTitleWidget(text: '종류'),
        MedicineItemLabel1Widget(text: '1. 트리헥시페니딜 염산염 '),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0603.jpg',
          text: '''트리헥신정 2mg - 태극제약''',
        ),
        MedicineItemLabel1Widget(text: '2. 벤즈트로핀메실레이트 '),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0604.jpg',
          text: '''벤즈트로핀정 1mg''',
        ),
        MedicineImageItem(
          text: '''환인벤즈트로핀정 – 환인제약 ''',
        ),
        MedicineImageItem(
          text: '''명인벤즈트로핀메실산염 – 명인제약''',
        ),

        MedicineItemLabel1Widget(text: '3. 프로시클리딘 '),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0605.jpg',
          text: '''프로이머 5mg ''',
        ),
        MedicineImageItem(
          text: '''파로마정 – 크리스탈생맹과학 ''',
        ),
        MedicineImageItem(
          text: '''명프로마정 -영진약품''',
        ),
        MedicineImageItem(
          text: '''파카프로시클리딘정- 한국파마''',
        ),
        MedicineImageItem(
          text: '''프로이머정 – 초당약룸 ''',
        ),
      ],
    );
  }
}
