import 'package:flutter/material.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../models/view_my_symptoms_item_model.dart';
import 'image_dialog.dart';

const String alertTitleMsg = '내 증상 기록 저장';
const String alertContentMsg = '내 증상 기록이 저장되었습니다.';

// view my symptoms item widget
class ViewMySymptomsItemWidget extends StatelessWidget {
  const ViewMySymptomsItemWidget({
    super.key,
    required this.item,
  });

  final ViewMySymptomsItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.title,
                    style: TextPath.TextF16W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.dateWritten,
                    style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '내 증상 기록',
                    style: TextPath.TextF16W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.content,
                    style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '영상 및 사진 업로드',
                    style: TextPath.TextF16W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          showImageAlertDialog(
                              context, alertTitleMsg, alertContentMsg);
                        },
                        child: Stack(
                          children: [
                            Image.asset(
                              'assets/my_symptoms/sample_img.png',
                              width: 90,
                              height: 60,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
