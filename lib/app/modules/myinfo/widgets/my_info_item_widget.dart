import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/my_info_item_model.dart';

// my info item widget
class MyInfoItemWidget extends StatelessWidget {
  const MyInfoItemWidget({
    super.key,
    required this.onClick,
    required this.item,
  });
  final MyInfoItemModel item;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Container(
                height: 50,
                padding: EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  item.title,
                  style: TextPath.TextF14W500.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ),
              Spacer(),
              Visibility(
                visible: item.vc != null,
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(right: 10),
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/myinfo/myinfo_list_icon.png',
                    width: 6,
                    height: 12,
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
