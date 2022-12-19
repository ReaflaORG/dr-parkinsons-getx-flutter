import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

// show alert dialog
showAlertDialog(
  BuildContext context,
  String alertTitleMsg,
  String alertContentMsg,
) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12),
      ),
    ),
    content: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text(
              alertTitleMsg,
              style: TextPath.TextF18W600.copyWith(),
            ),
          ),
          SizedBox(height: 16),
          Container(
            child: Text(
              alertContentMsg,
              style: TextPath.TextF16W400.copyWith(),
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 44,
            child: TextButton(
              onPressed: () => Get.back(),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: ColorPath.PrimaryDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: Text(
                '확인',
                style: TextPath.TextF16W600White.copyWith(),
              ),
            ),
          )
        ],
      ),
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
