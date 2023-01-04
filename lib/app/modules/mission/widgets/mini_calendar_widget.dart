import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../globals/global_inkwell_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/mission_controller.dart';

/// 미션 작성 페이지의 날짜 선택 위젯
///
/// [time] : 날짜
///
/// [isSelected] : 선택 여부
class MiniCalendar extends GetView<MissionController> {
  const MiniCalendar({
    super.key,
    required this.index,
    required this.isSelected,
    required this.time,
  });

  final int index;
  final DateTime time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 50.w,
      decoration: BoxDecoration(
        color: isSelected
            ? ColorPath.PrimaryLightColor
            : ColorPath.Background1HECEFF1,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: GlobalInkWellWidget(
        padding: EdgeInsets.symmetric(vertical: 5.w),
        borderRadius: 8.r,
        onTap: () {
          controller.current_index.value = index;
          controller.getMissionList();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              DateFormat('EEEE', 'ko').format(time)[0],
              style: TextPath.TextF12W500.copyWith(
                color: controller.getMiniCalendarColor(time),
              ),
            ),
            Text(
              DateFormat('d').format(time).toString(),
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
