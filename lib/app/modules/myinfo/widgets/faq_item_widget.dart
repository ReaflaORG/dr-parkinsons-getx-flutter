import 'package:base/app/model/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

// faq item widget
class FaqItemWidget extends StatelessWidget {
  const FaqItemWidget({
    super.key,
    required this.item,
  });
  final FaqModel item;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        title: Text(
          item.question,
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
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(18.w, 16.w, 18.w, 16.w),
                decoration: BoxDecoration(
                  color: ColorPath.Background1HECEFF1,
                ),
                child: Text(
                  item.answer,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
