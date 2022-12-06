// * 라디오 버튼
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final bool isCheck;
  final Function onClick;
  const RadioButton({
    Key? key,
    required this.title,
    required this.isCheck,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onClick(),
      style: TextButton.styleFrom(
        foregroundColor: ColorPath.TextGrey1H212121,
        backgroundColor: isCheck ? ColorPath.PrimaryDarkColor : Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: ColorPath.Border3E7E7E7,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextPath.TextF14W400.copyWith(
          color: isCheck ? Colors.white : ColorPath.TextGrey3H616161,
        ),
      ),
    );
  }
}
