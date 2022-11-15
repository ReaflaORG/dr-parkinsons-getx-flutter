import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/terms_and_condition_item_model.dart';

// terms and condition item widget
class TermsAndConditionItemWidget extends StatelessWidget {
  const TermsAndConditionItemWidget({
    super.key,
    required this.item,
  });
  final TermsAndConditionItemModel item;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        title: Text(
          item.title,
          style: TextStyle(
            color: ColorPath.TextGrey1H212121,
            fontWeight: FontWeight.w500,
            fontFamily: "SUIT",
          ),
        ),
        trailing: Image.asset(
          'assets/my_symptoms/expandable_lower_icon.png',
          width: 12,
          height: 6,
        ),
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                decoration: BoxDecoration(
                  color: ColorPath.Background1HECEFF1,
                ),
                child: Text(
                  item.content,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
