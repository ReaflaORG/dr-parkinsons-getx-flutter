import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';

// search doctors item widget
class DoctorCardWidget extends StatelessWidget {
  const DoctorCardWidget({
    super.key,
    required this.title,
    required this.isCheck,
    required this.onClick,
  });

  final String title;
  final bool isCheck;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onClick(),
      style: TextButton.styleFrom(
          foregroundColor: ColorPath.TextGrey1H212121,
          backgroundColor: isCheck ? ColorPath.PrimaryDarkColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
            side: BorderSide(
              color: isCheck
                  ? ColorPath.PrimaryDarkColor
                  : ColorPath.Border3E7E7E7,
            ),
          )),
      child: Text(
        title,
        style: isCheck
            ? TextPath.TextF12W500White
            : TextPath.TextF12W500.copyWith(),
      ),
    );
  }
}
