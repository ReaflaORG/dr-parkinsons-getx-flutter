import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/faq_listview_item_model.dart';

// faq item widget
class FaqItemWidget extends StatelessWidget {
  const FaqItemWidget({
    super.key,
    required this.item,
  });
  final FaqItemModel item;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        backgroundColor: Colors.transparent,
        title: Text(
          item.question,
          style:
              TextPath.TextF16W500.copyWith(color: ColorPath.TextGrey2H424242),
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
                  style: TextPath.TextF16W400Expand.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
