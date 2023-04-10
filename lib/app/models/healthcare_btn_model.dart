import 'package:flutter/material.dart';

class HealthCareBtnModel {
  HealthCareBtnModel({
    required this.name,
    required this.color,
    required this.icon,
    this.icon_width = 34,
    this.icon_height = 34,
    required this.onClick,
  });

  String name;
  Color color;
  String icon;
  int? icon_width;
  int? icon_height;
  Function onClick;
}
