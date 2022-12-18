import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

// show alert two options dialog
showAlertTwoOptionsDialog(
  BuildContext context,
  String type,
  String alertTitleMsg,
  String alertContentMsg,
  String firstButtonTitle,
  String secondButtonTitle,
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
          Row(
            children: [
              Container(
                child: Text(
                  alertTitleMsg,
                  style: TextPath.TextF18W600.copyWith(),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Ink.image(
                    image: AssetImage(
                      'assets/my_symptoms/close_gray_icon.png',
                    ),
                    width: 18,
                    height: 18,
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: !alertContentMsg.isEmpty ? true : false,
            child: Container(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                alertContentMsg,
                style: TextPath.TextF16W400.copyWith(),
              ),
            ),
          ),
          SizedBox(height: 24),
          Container(
            width: double.infinity,
            height: 44,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: ColorPath.Blue2F7ABAColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: Text(
                firstButtonTitle,
                style: TextPath.TextF16W600.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            height: 44,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey2H424242,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                side: BorderSide(
                  color: ColorPath.Background1HECEFF1,
                ),
              ),
              child: Text(
                secondButtonTitle,
                style: TextPath.TextF16W600.copyWith(),
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
