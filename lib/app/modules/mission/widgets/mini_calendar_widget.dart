import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class MiniCalendar extends StatelessWidget {
  final String dayName;
  final int day;
  const MiniCalendar({
    super.key,
    required this.dayName,
    required this.day,
  });
  @override
  Widget build(BuildContext context) {
    late Color text_color;
    if (dayName == '토') {
      text_color = ColorPath.SecondaryColor;
    } else if (dayName == '일') {
      text_color = ColorPath.TertiaryColor;
    } else {
      text_color = ColorPath.TextGrey1H212121;
    }
    return Container(
      width: 40.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: ColorPath.Background1HECEFF1,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            dayName,
            style: TextPath.TextF12W500.copyWith(color: text_color),
          ),
          Text(
            day.toString(),
            style: TextPath.TextF16W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ],
      ),
    );
  }
}
