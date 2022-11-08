import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../model/medicine_btn_model.dart';

class MedicineBtn extends StatelessWidget {
  const MedicineBtn({super.key, required this.item});
  final MedicineBtnModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        item.onClick();
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
                  child: Image.asset(width: 44.w, height: 44.w, item.icon),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                item.name,
                style: TextPath.TextF16W500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
