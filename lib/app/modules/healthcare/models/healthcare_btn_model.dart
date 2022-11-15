import 'package:flutter/material.dart';

class HealthCareBtnModel {
  HealthCareBtnModel(
      {required this.name,
      required this.color,
      required this.icon,
      required this.onClick});

  String name;
  Color color;
  String icon;
  Function onClick;
}
