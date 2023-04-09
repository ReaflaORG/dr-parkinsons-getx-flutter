import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../globals/global_inkwell_widget.dart';
import '../../../models/healthcare_btn_model.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: GlobalInkWellWidget(
        borderRadius: 8.r,
        onTap: () {
          item.onClick();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24).w,
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
                      item.icon,
                      width: item.icon_width?.w,
                      height: item.icon_height?.w,
                      cacheWidth: 63,
                      cacheHeight: 64,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
