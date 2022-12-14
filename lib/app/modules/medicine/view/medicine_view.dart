import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/medicine_controller.dart';
import '../widget/medicine_card_widget.dart';

/// 약물검색 페이지
class MedicineView extends GetView<MedicineController> {
  const MedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(74.w),
        child: AppBar(
          toolbarHeight: 84,
          backgroundColor: ColorPath.PrimaryLightColor,
          leadingWidth: 60,
          leading: Container(
            margin: const EdgeInsets.only(
              left: 20,
            ).w,
            child: CircleAvatar(
              backgroundColor: ColorPath.BackgroundWhite,
              radius: 24.r,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0,
          shadowColor: Colors.white,
          title: Text(
            '파킨슨 약물검색',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20).w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.w,
                  children: List.generate(
                    controller.pillBtns.length,
                    (index) {
                      return MedicineCardWidget(
                        index: index,
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
