import 'package:base/app/modules/myinfo/controller/my_symptoms_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';

// show alert two options dialog
showAlertTwoOptionsDialog({
  required BuildContext context,
  required Function handleOk,
  required String alertTitleMsg,
  required String alertContentMsg,
  required String firstButtonTitle,
  required String secondButtonTitle,
}) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(12.r),
      ),
    ),
    content: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                alertTitleMsg,
                style: TextPath.TextF18W600.copyWith(),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Ink.image(
                    image: const AssetImage(
                      'assets/my_symptoms/close_gray_icon.png',
                    ),
                    width: 18.w,
                    height: 18.w,
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: alertContentMsg.isNotEmpty ? true : false,
            child: Container(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                alertContentMsg,
                style: TextPath.TextF16W400.copyWith(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 44.w,
            child: TextButton(
              onPressed: () async {
                await handleOk();
                Get.back();
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: ColorPath.Blue2F7ABAColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  )),
              child: Text(
                firstButtonTitle,
                style: TextPath.TextF16W600.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 12.w),
          SizedBox(
            width: double.infinity,
            height: 44.w,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey2H424242,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
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
          ),
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
