import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class MiniCalendar extends StatelessWidget {
  final DateTime time;
  final bool isSelected;
  const MiniCalendar({
    super.key,
    required this.isSelected,
    required this.time,
  });
  @override
  Widget build(BuildContext context) {
    late Color text_color;
    if (DateFormat('EEEE', 'ko').format(time) == '토요일') {
      text_color = ColorPath.SecondaryColor;
    } else if (DateFormat('EEEE', 'ko').format(time) == '일요일') {
      text_color = ColorPath.TertiaryColor;
    } else {
      text_color = ColorPath.TextGrey1H212121;
    }
    return Container(
      width: 40.w,
      height: 50.w,
      decoration: BoxDecoration(
        color: isSelected
            ? ColorPath.PrimaryLightColor
            : ColorPath.Background1HECEFF1,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            DateFormat('EEEE', 'ko').format(time)[0],
            style: TextPath.TextF12W500.copyWith(color: text_color),
          ),
          Text(
            DateFormat('d').format(time).toString(),
            style: TextPath.TextF16W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ],
      ),
    );
  }
}
