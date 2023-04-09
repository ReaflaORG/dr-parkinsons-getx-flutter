import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'medicine_item.dart';

/// 콤트억제제 약제 설명 페이지
class MedicineInfoComptInhibitorPage extends StatelessWidget {
  const MedicineInfoComptInhibitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const MedicineItemTitleWidget(text: '약제명'),
        const MedicineItemDescriptionWidget(
          text: '콤트억제제 (COMT inhibitor)',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '설명'),
        const MedicineItemDescriptionWidget(
          text:
              '콤트억제제는 콤트라는 말초에서 도파민을 분해하는 효소를 차단해서 레보도파의 혈중농도를 더 높게 유지 할 수 있게 하는 약제로, 레보도파의 이용률을 증가시키고 지속시간을 증가시킨다.\r\n\r\n레보도파/도파탈탄산효소(Dopadecarboxylase) 억제제 표준치료제로 개선되지 않는 파킨슨병 환자의 운동 동요증상의 치료제로 쓰이며 약효소진 증상의 호전과 악화된 파킨슨 증상을 감소 시킬 수 있다. 현재 국내에서 처방가능한 콤트억제제는 엔타카폰과 오피카폰 두가지 제제이다.',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '부작용'),
        const MedicineItemDescriptionWidget(
          text: '구토, 설사, 혼돈, 환각, 비정상적인 꿈, 색뇨증, 빈혈, 식욕감퇴, 이상운동증',
        ),
        SizedBox(height: 20.w),
        const MedicineItemTitleWidget(text: '종류'),
        const MedicineItemLabel1Widget(text: '엔타카폰'),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0401.webp',
          text: '콤탄정 200mg',
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel2Widget(text: '엔타카폰 그외'),
        MedicineItemTableWidget(
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
                  child: const Text('알보젠코리아'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '콤탄정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '200mg',
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '삼일제약',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '엔타폰정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '200mg',
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
                    '명인엔타카폰정',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).w,
                  child: const Text(
                    '200mg',
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20.w),
        const MedicineItemLabel1Widget(text: '오피카폰'),
        const MedicineItemDescriptionWidget(
          text:
              '오피카폰은 기존의 엔타카폰이 가지고 있는 부작용인 설사와 소변색깔 변화의 부작용이 개선된 장점이 있고, 콤탄이 매번 도파민과 같이 복용하는 약제라면 온젠티스는 하루 한번 복용한다는 장점이 있다.',
        ),
        const MedicineImageItem(
          assest: 'assets/images/medicine/pill0402.webp',
          text: '온젠티스 50mg',
        ),
        const CopyrightWidget(),
      ],
    );
  }
}
