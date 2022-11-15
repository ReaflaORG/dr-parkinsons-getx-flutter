import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../model/search_doctors_item_model.dart';

// search doctors item widget
class SearchDoctorsItemWidget extends StatelessWidget {
  const SearchDoctorsItemWidget({
    super.key,
    required this.onClick,
    required this.item,
  });
  final SearchDoctorsItemModel item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorPath.GreyColor,
            width: 1,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.hospitalName,
                      style: TextPath.TextF14W500.copyWith(),
                    ),
                    Text(
                      item.hospitalAddress,
                      style: TextPath.TextF12W400.copyWith(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Text(
                        item.doctorName,
                        style: TextPath.TextF14W400.copyWith(
                          color: ColorPath.Blue2F7ABAColor,
                        ),
                      ),
                      Text(
                        " 의사",
                        style: TextPath.TextF14W400.copyWith(
                          color: ColorPath.TextGrey3H616161,
                        ),
                      ),
                    ],
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
