import 'package:flutter/material.dart';

import '../widget/medicine_item.dart';

/// 마오비 억제제 약제 설명 페이지
class MedicineInfoMaobInhibitorPage extends StatelessWidget {
  const MedicineInfoMaobInhibitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        MedicineItemTitleWidget(text: '약제명'),
        MedicineItemDescriptionWidget(
          text: '''마오비 억제제 ''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '설명'),
        MedicineItemDescriptionWidget(
          text:
              '''마오비 억제제는 레보도파가 뇌에서 마오비로 인해 대사되는 것을 막아서 레보도파의 효능을 증진시키고, 도파민이 신경계에 더 오래 남아있을 수 있도록 돕는 약제이다. 

현재 국내에서 사용가능한 마오비 억제제는 1세대 셀레길린, 2세대 라사질린, 최근 도입된 3세대 사피나마이드가 있다. ''',
        ),
        SizedBox(
          height: 20,
        ),
        MedicineItemTitleWidget(text: '부작용'),
        MedicineItemDescriptionWidget(
          text: '''구역, 어지러움, 불면, 이상운동증, 환각, 기립성저혈압 등 ''',
        ),
        SizedBox(height: 20),
        MedicineItemTitleWidget(text: '종류'),
        MedicineItemLabel1Widget(text: '1. 셀레길린'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0501.jpg',
          text: '''콤마오비정 5mg''',
        ),
        MedicineImageItem(text: '''마오비정 – 초당약품공업'''),
        MedicineItemLabel1Widget(text: '2. 라자질린'),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0502.jpg',
          text: '''아질렉트 0.5mg''',
        ),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0503.jpg',
          text: '''아질렉트정 1mg''',
        ),
        MedicineImageItem(text: '아질렉트- 한국룬드벡'),
        MedicineImageItem(text: '파카라사길린정- 한국파마 '),
        MedicineImageItem(text: '이연라사길린메실산염정- 이연제약 '),
        MedicineImageItem(text: '한화라사길린정 -한화제약'),
        MedicineImageItem(text: '유니온라사길린정 -한국유니온제약 '),
        MedicineImageItem(text: '녹십자라사길린정- 녹십자'),
        MedicineImageItem(text: '보령라사길린정 -보령 '),
        MedicineImageItem(text: '삼성라사길린정- 삼성제약 '),
        MedicineImageItem(text: '라사민정-한국글로벌제약 '),
        MedicineImageItem(text: '유렉트정- 유유제약 '),
        MedicineImageItem(text: '라사렉트정 – 에이치엘비제약 '),
        MedicineImageItem(text: '라질렌정- 고려제약 '),
        MedicineImageItem(text: '파키스정-경보제약'),
        MedicineImageItem(text: '라사렉트정-파마사이언스코리아 '),
        MedicineImageItem(text: '아질라사정- 대웅바이오 '),
        MedicineImageItem(text: '라사핀정- 환인제약 '),
        MedicineImageItem(text: '뉴질렉트정- 하나제약 '),
        MedicineImageItem(text: '라사질트- 현대약품'),
        MedicineImageItem(text: '라사린정-명인제약 '),
        MedicineImageItem(text: '에도파벨정- 종근당 '),
        MedicineImageItem(text: '베아렉트정 -대웅제약 '),
        MedicineImageItem(text: '마오렉스정-초당약품공업'),
        MedicineImageItem(text: '셀파린정- 셀트리온제약 '),
        MedicineImageItem(text: '라사트정-한국프라임제약'),
        MedicineImageItem(text: '알사킨정-한국파비스제약'),
        MedicineImageItem(text: '라사길정-메디카코리아 '),
        MedicineImageItem(text: '파질렉트정- 대우제약'),
        MedicineImageItem(text: '마오렉트정-일화'),
        MedicineImageItem(text: '라사갈린정- 한풍제약'),
        MedicineImageItem(text: '길렉트정- 삼일제약'),
        MedicineImageItem(text: '이지렉트정-마더스제약'),
        MedicineImageItem(text: '라사원정-제일제약'),
        MedicineImageItem(text: '라시렉트정- 안국뉴팜'),
        MedicineItemLabel1Widget(text: '3. 사파나마이드'),
        MedicineItemDescriptionWidget(
            text:
                '''사파나마이드는 3세대 마오비 억제제로 dural 작용기전을 가지고 있어, 이전 세대의 MAO-B 억제제와는 차별적으로 Dopaminergic 경로 뿐만 아니라 glutamate 경로를 조절함으로서 진통제사용감소, 기분 개선, 삶의 질 개선 등의 비운동증상 개선에 도움이 된다.'''),
        SizedBox(height: 10),
        MedicineImageItem(
          assest: 'assets/images/medicine/pill0502.jpg',
          text: '''에퀴피나필름코팅정 50mg''',
        ),
        MedicineImageItem(text: '에퀴피나필름코팅정 – 한국에자이'),
      ],
    );
  }
}
