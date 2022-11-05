import 'package:base/app/modules/healthcare/models/healthcare_btn_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

class HealthcareMainbtn extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const HealthcareMainbtn({required this.item});
  final HealthCareBtnModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => item.onClick(),
      child: Container(
        // width: 140.w,
        // height: 140.w,
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              child: Text(
                item.name,
                style: TextPath.TextF16W500.copyWith(
                    color: ColorPath.TextGrey1H212121),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 60.w,
                height: 60.w,
                child: CircleAvatar(
                  backgroundColor: ColorPath.BackgroundWhite,
                  child: Image.asset(width: 44.w, height: 44.w, item.icon),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
