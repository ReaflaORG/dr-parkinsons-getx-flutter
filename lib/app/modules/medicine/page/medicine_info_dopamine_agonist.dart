import 'package:flutter/material.dart';

import '../widget/medicine_item.dart';

/// 도파민작용제 약제 설명 페이지
class MedicineInfoDopamineAgonistPage extends StatelessWidget {
  const MedicineInfoDopamineAgonistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        MedicineItemTitleWidget(text: '약제명'),
        MedicineItemDescriptionWidget(
          text: '''도파민 작용제(효능제, 효현제)''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '설명'),
        MedicineItemDescriptionWidget(
          text:
              '''도파민 작용제는 시냅스 연접후 도파민수용체(post-synpatic striatal dopamine receptors)를 자극하여 도파민이 증가한것처럼 반응하게 한다. 단독 투여로도 어느 정도 증상 개선 효과가 있고, 도파민제에 비해 반감기가 길어서 장기간 투여해도 이상 운동, 약효 감퇴 같은 부작용이 적어서 특히 처음 치료를 시작하는 젊은 환자에서 투여하는 경우가 많다. ''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '부작용'),
        MedicineItemDescriptionWidget(
          text: '''구역, 구토, 어지러움, 과도한 주간 졸음, 기립성 저혈압, 악몽, 환각, 충동조절장애 등''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '종류'),
        MedicineItemLabel1Widget(text: '1. 로파티롤'),
        MedicineItemLabel2Widget(text: '일반형'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0301.jpg',
          text: '''리큅 0.25mg''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0302.jpg',
          text: '''리큅 1mg''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0303.jpg',
          text: '''리큅 2mg''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0304.jpg',
          text: '''리큅 4mg''',
        ),
        MedicineImageItem(
          text: '''리큅- 글락소스미스클라인''',
        ),
        MedicineImageItem(
          text: '''로피맥스정_고려제약 ''',
        ),
        MedicineImageItem(
          text: '''파키놀정-명인제약''',
        ),
        MedicineImageItem(
          text: '''파키놀정-명인제약''',
        ),
        MedicineImageItem(
          text: '''오니롤정-한미약품''',
        ),
        MedicineImageItem(
          text: '''뉴큅정-유한제약''',
        ),
        MedicineImageItem(
          text: '''도파프로정-제일약품''',
        ),
        MedicineImageItem(
          text: '''프라큅정- 한국프라임제약''',
        ),
        MedicineImageItem(
          text: '''리키롤정-대웅바이오''',
        ),
        MedicineItemLabel2Widget(text: '서방형'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0305.jpg',
          text: '''리큅 피디 2mg''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0306.jpg',
          text: '''리큅 피디 4mg ''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0307.jpg',
          text: '''리큅 피디 8mg ''',
        ),
        MedicineImageItem(text: '리큅- 글락소스미스클라인'),
        MedicineImageItem(text: '로피맥스정_고려제약 '),
        MedicineImageItem(text: '파키놀정-명인제약'),
        MedicineImageItem(text: '오니롤정-한미약품'),
        MedicineImageItem(text: '뉴큅정-유한제약'),
        MedicineImageItem(text: '도파프로정-제일약품'),
        MedicineImageItem(text: '프라큅정- 한국프라임제약 '),
        MedicineImageItem(text: '리키롤정-대웅바이오'),
        MedicineImageItem(text: '리큅피디정-글락소스미스클라인'),
        MedicineImageItem(text: '로피맥스피디정-고려제약'),
        MedicineImageItem(text: '로피리노서방정-한국파마'),
        MedicineImageItem(text: '리키롤피디정-대웅바이오'),
        MedicineImageItem(text: '파키놀피디정-명인제약'),
        MedicineImageItem(text: '현대로피니롤서방정-현대약품 '),
        // 약재 2
        MedicineItemLabel1Widget(text: '2. 프라미펙솔'),
        MedicineItemLabel2Widget(text: '일반형'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0308.jpg',
          text: '''미라펙스 0.25mg ''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0309.jpg',
          text: '''미라펙스 0.5mg''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0310.jpg',
          text: '''미라펙스 1mg ''',
        ),
        MedicineImageItem(text: '미라펙스정-한국베링거인겔하임'),
        MedicineImageItem(text: '피디펙솔정-명인제약'),
        MedicineImageItem(text: '프라펙솔정-삼일제약'),
        MedicineImageItem(text: '미라프정-현대약품'),
        MedicineItemLabel2Widget(text: '서방형'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0311.jpg',
          text: '''미라펙스 서방정 0.375mg ''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0312.jpg',
          text: '''미라펙스 서방정 0.75mg''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0313.jpg',
          text: '''미미라펙스 서방정 1.5mg''',
        ),
        MedicineImageItem(text: '미라펙스서방정-한국베링거인겔하임'),
        MedicineImageItem(text: '피디펙솔서방정-명인제약'),
        MedicineImageItem(text: '프라펙솔서방정-삼일제약'),
        MedicineImageItem(text: '미라프서방정-현대약품'),
      ],
    );
  }
}
