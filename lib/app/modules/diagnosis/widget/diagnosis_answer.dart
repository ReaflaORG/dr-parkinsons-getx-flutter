import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class DiagnosisAnswer extends StatelessWidget {
  const DiagnosisAnswer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: 300.w,
            decoration: BoxDecoration(
              border: Border.all(color: ColorPath.PrimaryLightColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 40.w,
                  child: SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Image.asset('assets/images/icons/2d/24false1.png'),
                  ),
                ),
                Expanded(
                  child: Text(
                    '매우 그렇다.',
                    style: TextPath.TextF16W500.copyWith(
                      color: ColorPath.TextGrey2H424242,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: 300.w,
              decoration: BoxDecoration(
                  border: Border.all(color: ColorPath.PrimaryLightColor),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: ColorPath.PrimaryLightColor),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 40.w,
                    child: SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: Image.asset('assets/images/icons/2d/24true.png'),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    '매우 그렇다.',
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