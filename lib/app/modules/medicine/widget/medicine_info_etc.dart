import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/medicine_item.dart';

/// 도파민제 약제 설명 페이지
class MedicineInfoEtcPage extends StatelessWidget {
  const MedicineInfoEtcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // 약재 1
        const MedicineItemTitleWidget(text: '약제명'),
        const MedicineItemDescriptionWidget(
          text: '아만타딘',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '설명'),
        const MedicineItemDescriptionWidget(
          text:
              '아만타딘은 항바이러스제제로 파킨슨병 환자의 증상을 개선시킨다는 것이 점차 알려저 항파킨슨제로 사용되고 있다.\r\n\r\n아만타딘은 여러 수용체에 작용하는 약제로 항콜린 효과와 더불어 항글루타메이트 효과가 있어서 이상운동증을 조절하는데 유용하다.  ',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '부작용'),
        const MedicineItemDescriptionWidget(
          text: '입마름, 변비, 시야흐림, 소변장애, 인지장애, 환시, 그물울혈반, 하지 부종 등',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '종류'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0601.jpg',
          text: '피케이멜즈정 100mg  - 한화제약',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0602.jpg',
          text: '아만타정 100mg  - 고려제약',
        ),
        SizedBox(height: 40.w),
        const MedicineItemTitleWidget(text: '약제명'),
        const MedicineItemDescriptionWidget(
          text: '항콜린제제',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '설명'),
        const MedicineItemDescriptionWidget(
          text:
              '항콜린제는 도파민의 감소에 인해 상태적으로 증가된 아세틸콜린의 작용을 억제하는 약물로 파킨슨 증상중에서 주로 떨림에 효과가 좋다.\r\n\r\n부작용이 많아서 고령의 환자나 인지장애가 있는 환자는 주의가 요한다. ',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '부작용'),
        const MedicineItemDescriptionWidget(
          text: '입마름, 변비, 시야흐림, 소변장애, 인지장애, 환시 등 ',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '종류'),
        const MedicineItemLabel1Widget(text: '1. 트리헥시페니딜 염산염 '),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0603.jpg',
          text: '트리헥신정 2mg - 태극제약',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel1Widget(text: '2. 벤즈트로핀메실레이트 '),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0604.jpg',
          text: '벤즈트로핀정 1mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '벤즈트로핀메실레이트 그외'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(1.3.w),
            2: FlexColumnWidth(0.4.w),
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
                  child: const Text('환인제약'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '환인벤즈트로핀정',
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
                    '명인벤즈트로핀메실산염',
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
        const MedicineItemLabel1Widget(text: '3. 프로시클리딘 '),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0605.jpg',
          text: '프로이머 5mg ',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '벤즈트로핀메실레이트 그외'),
        MedicineItemTableWidget(
          columnWidths: {
            1: FlexColumnWidth(1.w),
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
                  child: const Text('크리스탈생맹과학'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '파로마정',
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
                  child: const Text('영진약품'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '명프로마정',
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
                    '파카프로시클리딘정',
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
                  child: const Text('초당약룸'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '프로이머정',
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
