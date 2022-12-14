import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/drugmisuse_infobox_model.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';

/// 약물남용 정보 박스
///
/// [box] DrugMisuseInfoBoxModel : 박스 모델
class DrugMisuseInfoBox extends StatelessWidget {
  const DrugMisuseInfoBox({
    super.key,
    required this.box,
  });

  final DrugMisuseInfoBoxModel box;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ).w,
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 36.w,
          decoration: BoxDecoration(
            color: ColorPath.TertiaryLightColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(6).r,
              topRight: const Radius.circular(6).r,
            ),
          ),
          child: Text(
            box.title,
            style: TextPath.TextF13W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12).w,
          decoration: BoxDecoration(
            color: ColorPath.BackgroundWhite,
            border: Border.all(
              color: ColorPath.TertiaryLightColor,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(6).r,
              bottomRight: const Radius.circular(6).r,
            ),
          ),
          child: Text(
            box.text,
            style: TextPath.TextF13W500Expand.copyWith(
              color: ColorPath.TextGrey2H424242,
            ),
          ),
        )
      ],
    );
  }
}
