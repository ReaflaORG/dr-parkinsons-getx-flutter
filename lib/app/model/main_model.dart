import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  String? description;
  Icon? icon;
  String? image;
  String? imageActive;
  int? width;
  int? height;

  NavigationModel({
    required this.title,
    this.description,
    this.icon,
    this.image,
    this.imageActive,
    this.width = 25,
    this.height = 24,
  });

  NavigationModel copyWith({
    required String title,
    String description = '',
    Icon icon = const Icon(Icons.abc),
    String image = '',
    String imageActive = '',
    int width = 25,
    int height = 24,
  }) =>
      NavigationModel(
        title: title,
        description: description,
        icon: icon,
        image: image,
        imageActive: imageActive,
        width: width,
        height: height,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'icon': icon,
        'image': image,
        'image_active': imageActive,
        'width': width,
        'height': height,
      };
}
