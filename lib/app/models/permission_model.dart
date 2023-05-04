import 'package:flutter/material.dart';

class PermissionModel {
  String title;
  IconData? icon;
  String? image;
  String description;
  bool isRequired;
  bool isExpanded;

  PermissionModel({
    this.title = '',
    this.icon,
    this.image = '',
    this.description = '',
    this.isRequired = false,
    this.isExpanded = false,
  });

  PermissionModel copyWith({
    String title = '',
    IconData icon = Icons.abc,
    String image = '',
    String description = '',
    bool isRequired = false,
    bool isExpanded = false,
  }) =>
      PermissionModel(
        title: title,
        icon: icon,
        image: image,
        description: description,
        isRequired: isRequired,
        isExpanded: isExpanded,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'icon': icon,
        'image': image,
        'description': description,
        'isRequired': isRequired,
        'isExpanded': isExpanded,
      };
}
