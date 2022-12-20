import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPageView extends StatefulWidget {
  final List<String> images;
  final int initIndex;
  const PhotoPageView({Key? key, required this.images, this.initIndex = 0})
      : super(key: key);

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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarBrightness: Brightness.dark,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              onPageChanged: ((index) {
                setState(() {
                  current_index = index;
                });
              }),
              children: List.generate(
                widget.images.length,
                (index) => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: PhotoView(
                    initialScale: PhotoViewComputedScale.contained * 1,
                    imageProvider:
                        CachedNetworkImageProvider(widget.images[index]),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              color: Colors.black.withOpacity(0.7),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top),
                  Container(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.keyboard_arrow_left_rounded,
                            size: 24.w,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        const Spacer(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
