import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  String? description;
  Icon? icon;
  String? image;

  NavigationModel({
    required this.title,
    this.description,
    this.icon,
    this.image,
  });

  NavigationModel copyWith({
    required String title,
    String description = '',
    Icon icon = const Icon(Icons.abc),
    String image = '',
  }) =>
      NavigationModel(
        title: title,
        description: description,
        icon: icon,
        image: image,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'icon': icon,
        'image': image,
      };
}
