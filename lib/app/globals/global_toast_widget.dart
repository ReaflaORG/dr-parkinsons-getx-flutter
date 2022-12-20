// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 글로벌 토스트 위젯
/// [message] 메세지
/// [bottom]: 바닥 마진
/// [duration]: 유지 시간 (초)
Future<dynamic> GlobalToastWidget({
  /// 메세지
  required String message,

  /// 유지 시간
  int duration = 3,
}) async {
  Future.value([
    Fluttertoast.cancel(),
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: duration,
      backgroundColor: Colors.black.withOpacity(0.7),
      textColor: Colors.white,
    ),
  ]);
  // ScaffoldMessenger.of(Get.overlayContext as BuildContext)
  //     .hideCurrentSnackBar();
  // Get.showSnackbar(GetSnackBar(
  //   duration: Duration(seconds: duration),
  //   animationDuration: const Duration(seconds: 0),
  //   snackPosition: SnackPosition.BOTTOM,
  //   backgroundColor: Colors.transparent,
  //   messageText: Row(
  //     mainAxisSize: MainAxisSize.min,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         padding: EdgeInsets.symmetric(
  //           horizontal: 20.w,
  //           vertical: 10.w,
  //         ),
  //         decoration: BoxDecoration(
  //           color: Colors.black.withOpacity(0.8),
  //           borderRadius: BorderRadius.circular(25),
  //         ),
  //         alignment: Alignment.center,
  //         child: Text(
  //           message,
  //           overflow: TextOverflow.ellipsis,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.w600,
  //             fontSize: 15.sp,
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  //   margin: EdgeInsets.only(bottom: bottom),
  // ));
}
