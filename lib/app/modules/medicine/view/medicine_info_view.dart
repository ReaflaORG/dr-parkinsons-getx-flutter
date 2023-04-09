import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/medicine_info_controller.dart';

/// 약제 정보 페이지
class MedicineInfoView extends GetView<MedicineInfoController> {
  const MedicineInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          title: Text(
            controller.medicineName.value!,
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(74.w),
        //   child: AppBar(
        //     toolbarHeight: 84.w,
        //     backgroundColor: ColorPath.PrimaryLightColor,
        //     leadingWidth: 60.w,
        //     leading: Container(
        //       margin: const EdgeInsets.only(
        //         left: 20,
        //       ).w,
        //       child: CircleAvatar(
        //         backgroundColor: ColorPath.BackgroundWhite,
        //         radius: 24.r,
        //         child: IconButton(
        //           onPressed: () {
        //             Get.back();
        //           },
        //           icon: Icon(
        //             Icons.arrow_back,
        //             color: ColorPath.TextGrey1H212121,
        //           ),
        //         ),
        //       ),
        //     ),
        //     centerTitle: false,
        //     elevation: 0,
        //     shadowColor: Colors.white,
        //     title: Text(
        //       controller.medicineName.value!,
        //       style: TextPath.Heading2F18W600.copyWith(
        //         color: ColorPath.TextGrey1H212121,
        //       ),
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20).w,
            child: controller.childWidget(),
          ),
        ),
      ),
    );
  }
}
