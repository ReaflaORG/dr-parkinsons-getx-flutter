import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) => Obx(
        () => Scaffold(
          body: controller.handleScreen(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorPath.BackgroundWhite,
              border: Border.all(
                width: 1,
                color: ColorPath.Border2HECEFF1,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: controller.navigationIndex.value,
                backgroundColor: ColorPath.BackgroundWhite,
                elevation: 10,
                selectedItemColor: ColorPath.BlackColor,
                unselectedItemColor: ColorPath.TextGrey4H9E9E9E,
                selectedLabelStyle: TextPath.TextF12W400,
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
                      activeIcon: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          controller.navigationData[index].image!,
                          width: 25.w,
                          height: 24.h,
                        ),
                      ),
                      icon: Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          controller.navigationData[index].image!,
                          width: 25.w,
                          height: 24.h,
                        ),
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
