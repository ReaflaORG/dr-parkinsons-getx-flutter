// * 라디오 버튼
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/profile_setting_controller.dart';

class RadioButtonForProfile extends GetView<ProfileSettingController> {
  const RadioButtonForProfile({
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
    return Padding(
      padding: const EdgeInsets.only(right: 8).w,
      child: TextButton(
        onPressed: () {
          onClick();
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4).w,
          foregroundColor: ColorPath.TextGrey1H212121,
          backgroundColor: isCheck ? ColorPath.PrimaryDarkColor : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8).r,
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
      ),
    );
  }
}
