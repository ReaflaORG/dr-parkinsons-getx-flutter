import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class DiagnosisAnswer extends StatelessWidget {
  final Function onPick; // 클릭햇을 떄 변환해주는 함수
  final int pick; //현재 선택된 값
  const DiagnosisAnswer({super.key, required this.onPick, required this.pick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              onPick(0);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 300.w,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorPath.PrimaryLightColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color:
                      pick == 0 ? ColorPath.PrimaryLightColor : Colors.white),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 40.w,
                    child: SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: pick == 0
                            ? Image.asset('assets/images/icons/2d/24true.png')
                            : Image.asset(
                                'assets/images/icons/2d/24false.png')),
                  ),
                  Expanded(
                    child: Text(
                      '예',
                      style: TextPath.TextF16W500.copyWith(
                        color: ColorPath.TextGrey2H424242,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              onPick(1);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 300.w,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorPath.PrimaryLightColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color:
                      pick == 1 ? ColorPath.PrimaryLightColor : Colors.white),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 40.w,
                    child: SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: pick == 1
                            ? Image.asset('assets/images/icons/2d/24true.png')
                            : Image.asset(
                                'assets/images/icons/2d/24false.png')),
                  ),
                  Expanded(
                      child: Text(
                    '아니오',
                    style: TextPath.TextF16W500.copyWith(
                      color: ColorPath.TextGrey2H424242,
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
