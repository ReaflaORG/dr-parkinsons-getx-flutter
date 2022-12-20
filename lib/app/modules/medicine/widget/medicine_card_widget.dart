import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/medicine_controller.dart';

/// 약물검색 카드 위젯
///
/// [index] int 인덱스
class MedicineCardWidget extends GetView<MedicineController> {
  const MedicineCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.pillBtns[index].onClick();
      },
      child: Container(
        width: 140.w,
        height: 140.w,
        decoration: BoxDecoration(
          color: ColorPath.Background1HECEFF1,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 60.w,
                height: 60.w,
                child: CircleAvatar(
                  backgroundColor: ColorPath.BackgroundWhite,
                  child: Image.asset(
                    controller.pillBtns[index].icon,
                    width: 44.w,
                    height: 44.w,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                controller.pillBtns[index].name,
                style: TextPath.TextF16W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
