import 'package:flutter/material.dart';

// show image alert dialog
showImageAlertDialog(
  BuildContext context,
  String alertTitleMsg,
  String alertContentMsg,
) {
  AlertDialog alert = AlertDialog(
    content: Container(
      height: 222,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
        image: const DecorationImage(
          image: ExactAssetImage('assets/doctor/doctor_1.png'),
          fit: BoxFit.cover,
        ),
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
