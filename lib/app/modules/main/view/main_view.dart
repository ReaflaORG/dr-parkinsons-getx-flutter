import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: controller.handleScreen(),
        bottomNavigationBar: Container(
          // height: Platform.isIOS ? 62.h : 62.h,
          padding: const EdgeInsets.only(top: 4).w,
          decoration: BoxDecoration(
            color: ColorPath.BackgroundWhite,
            border: Border.all(
              width: 1,
              color: ColorPath.Border2HECEFF1,
            ),
            borderRadius: BorderRadius.only(
              topRight: const Radius.circular(12).r,
              topLeft: const Radius.circular(12).r,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12).r,
              topRight: const Radius.circular(12).r,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.navigationIndex.value,
              backgroundColor: ColorPath.BackgroundWhite,
              elevation: 10,
              selectedItemColor: ColorPath.BlackColor,
              unselectedItemColor: ColorPath.TextGrey4H9E9E9E,
              selectedLabelStyle: TextPath.TextF12W600,
              unselectedLabelStyle: TextPath.TextF12W400.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              onTap: (index) {
                controller.navigationIndex.value = index;
              },
              items: List.generate(
                controller.navigationData.length,
                (index) {
                  return BottomNavigationBarItem(
                    activeIcon: IconWidget(
                      index: index,
                      image: controller.navigationData[index].imageActive!,
                      width: controller.navigationData[index].width!,
                      height: controller.navigationData[index].height!,
                    ),
                    icon: IconWidget(
                      index: index,
                      image: controller.navigationData[index].image!,
                      width: controller.navigationData[index].width!,
                      height: controller.navigationData[index].height!,
                    ),
                    label: controller.navigationData[index].title,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 아이콘 위젯
class IconWidget extends GetView<MainController> {
  final int index;
  final String image;
  final int width;
  final int height;

  const IconWidget({
    super.key,
    required this.index,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5).w,
      child: Image.asset(
        image,
        width: width.w,
        height: height.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
