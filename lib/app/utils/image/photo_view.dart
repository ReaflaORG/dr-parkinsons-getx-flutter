import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../globals/global_layout_widget.dart';
import '../../theme/color_path.dart';

class PhotoPageView extends StatefulWidget {
  const PhotoPageView({
    super.key,
    required this.images,
    this.initIndex = 0,
  });

  final List<String> images;
  final int initIndex;

  @override
  State<PhotoPageView> createState() => _PhotoPageViewState();
}

class _PhotoPageViewState extends State<PhotoPageView> {
  late int current_index;
  late PageController controller;

  @override
  void initState() {
    current_index = widget.initIndex;
    controller = PageController(initialPage: current_index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLayoutWidget(
      context: context,
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 39.w,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 18).w,
            child: Image.asset(
              'assets/doctor/back_arrow.png',
              width: 21.w,
              height: 13.5.w,
              color: ColorPath.BackgroundWhite,
            ),
          ),
        ),
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: false,
          boundaryMargin: const EdgeInsets.all(100).w,
          minScale: 0.5,
          maxScale: 2,
          child: CachedNetworkImage(
            imageUrl: widget.images[0],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
