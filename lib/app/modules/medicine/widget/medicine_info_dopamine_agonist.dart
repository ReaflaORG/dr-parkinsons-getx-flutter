import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/medicine_item.dart';

/// 도파민작용제 약제 설명 페이지
class MedicineInfoDopamineAgonistPage extends StatelessWidget {
  const MedicineInfoDopamineAgonistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MedicineItemTitleWidget(text: '약제명'),
        const MedicineItemDescriptionWidget(
          text: '도파민 작용제(효능제, 효현제)',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '설명'),
        const MedicineItemDescriptionWidget(
          text:
              '''도파민 작용제는 시냅스 연접후 도파민수용체(post-synpatic striatal dopamine receptors)를 자극하여 도파민이 증가한것처럼 반응하게 한다. 단독 투여로도 어느 정도 증상 개선 효과가 있고, 도파민제에 비해 반감기가 길어서 장기간 투여해도 이상 운동, 약효 감퇴 같은 부작용이 적어서 특히 처음 치료를 시작하는 젊은 환자에서 투여하는 경우가 많다. ''',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '부작용'),
        const MedicineItemDescriptionWidget(
          text: '''구역, 구토, 어지러움, 과도한 주간 졸음, 기립성 저혈압, 악몽, 환각, 충동조절장애 등''',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '종류'),
        const MedicineItemLabel1Widget(text: '1. 로파티롤'),
        const MedicineItemLabel2Widget(text: '일반형'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0301.webp',
          text: '리큅 0.25mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0302.webp',
          text: '리큅 1mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0303.webp',
          text: '리큅 2mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0304.webp',
          text: '리큅 4mg',
        ),
        const MedicineItemLabel2Widget(text: '일반형 그외'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(0.6.w),
            2: FlexColumnWidth(0.3.w),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('제조사'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이름',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '용량',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('글락소스미스클라인'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '리큅',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '고려제약',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '로피맥스정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '명인제약',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '파키놀정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '한미약품',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '오니롤정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '유한제약',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '뉴큅정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '제일약품',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '도파프로정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '한국프라임제약',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '프라큅정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '대웅바이오',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '리키롤정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '서방형'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0305.webp',
          text: '리큅 피디 2mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0306.webp',
          text: '리큅 피디 4mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0307.webp',
          text: '리큅 피디 8mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '서방형 그외'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(0.8.w),
            2: FlexColumnWidth(0.3.w),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('제조사'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이름',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '용량',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('글락소스미스클라인'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '리큅',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('고려제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '로피맥스정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('명인제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '파키놀정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한미약품'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '오니롤정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('유한제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '뉴큅정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('제일약품'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '도파프로정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국프라임제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '프라큅정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('대웅바이오'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '리키롤정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('글락소스미스클라인'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '리큅피디정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('고려제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '로피맥스피디정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국파마'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '로피리노서방정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('대웅바이오'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '리키롤피디정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('명인제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '파키놀피디정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('현대약품'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '현대로피니롤서방정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel1Widget(text: '2. 프라미펙솔'),
        const MedicineItemLabel2Widget(text: '일반형'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0308.webp',
          text: '미라펙스 0.25mg ',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0309.webp',
          text: '미라펙스 0.5mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0310.webp',
          text: '미라펙스 1mg ',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '일반형 그외'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(0.8.w),
            2: FlexColumnWidth(0.3.w),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('제조사'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이름',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '용량',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국베링거인겔하임'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '미라펙스정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('명인제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '피디펙솔정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('삼일제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '프라펙솔정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('현대약품'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '미라프정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '서방형'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0311.webp',
          text: '미라펙스 서방정 0.375mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0312.webp',
          text: '미라펙스 서방정 0.75mg',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0313.webp',
          text: '미미라펙스 서방정 1.5mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '서방형 그외'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(0.8.w),
            2: FlexColumnWidth(0.3.w),
          },
          children: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.shade200.withOpacity(0.5),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('제조사'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '이름',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '용량',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('한국베링거인겔하임'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '미라펙스서방정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('명인제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '피디펙솔서방정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('삼일제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '프라펙솔서방정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
            TableRow(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text('현대약품'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '미라프서방정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '-',
                  ),
                ),
              ],
            ),
          ],
        ),
        const CopyrightWidget(),
      ],
    );
  }
}
