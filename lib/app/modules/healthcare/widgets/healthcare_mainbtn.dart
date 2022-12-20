import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/healthcare_btn_model.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

/// 건강관리 메인 버튼
///
/// [item] HealthCareBtnModel : 버튼 모델
class HealthcareMainbtn extends StatelessWidget {
  const HealthcareMainbtn({
    super.key,
    required this.item,
  });

  final HealthCareBtnModel item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        item.onClick();
      },
      child: Container(
        // width: 140.w,
        // height: 140.w,
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                item.name,
                style: TextPath.TextF16W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 60.w,
                height: 60.w,
                child: CircleAvatar(
                  backgroundColor: ColorPath.BackgroundWhite,
                  child: Image.asset(
                    width: 44.w,
                    height: 44.w,
                    item.icon,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
