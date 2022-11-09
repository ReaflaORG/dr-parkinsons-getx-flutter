import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/drugmisuse_infobox_model.dart';

class DrugMisuseInfoBox extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DrugMisuseInfoBox({required this.box});
  final DrugMisuseInfoBoxModel box;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          height: 36.w,
          decoration: BoxDecoration(
            color: ColorPath.TertiaryLightColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(6),
              topRight: Radius.circular(6),
            ),
          ),
          child: Text(
            box.title,
            style: TextPath.TextF13W500,
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ColorPath.BackgroundWhite,
            border: Border.all(color: ColorPath.TertiaryLightColor),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(6),
              bottomRight: Radius.circular(6),
            ),
          ),
          child: Text(
            box.text,
            style: TextPath.TextF13W500,
          ),
        )
      ],
    );
  }
}
