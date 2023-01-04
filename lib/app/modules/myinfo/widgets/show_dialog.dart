import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';

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
    content: SizedBox(
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
          SizedBox(height: 16.w),
          Container(
            child: Text(
              alertContentMsg,
              style: TextPath.TextF16W400.copyWith(),
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: TextButton(
              onPressed: () => Navigator.pop(context),
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

// show alert dialog
showConfimDialog(
  BuildContext context,
  String alertTitleMsg,
  String alertContentMsg,
  Function handleOk,
) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        const Radius.circular(12).r,
      ),
    ),
    content: SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            alertTitleMsg,
            style: TextPath.TextF18W600.copyWith(),
          ),
          SizedBox(height: 16.w),
          Text(
            alertContentMsg,
            style: TextPath.TextF16W400.copyWith(),
          ),
          SizedBox(height: 24.w),
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
                  backgroundColor: ColorPath.PrimaryDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              child: Text(
                '삭제하기',
                style: TextPath.TextF16W600White.copyWith(),
              ),
            ),
          ),
          SizedBox(height: 10.w),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey2H424242,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8).r,
                ),
                side: BorderSide(
                  color: ColorPath.Background1HECEFF1,
                ),
              ),
              child: Text(
                '취소하기',
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
