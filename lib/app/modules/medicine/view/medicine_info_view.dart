import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/medicine_info_controller.dart';
import '../page/medicine_info_dopamine.dart';

class MedicineInfoView extends GetView<MedicineInfoController> {
  const MedicineInfoView({super.key});

  @override
  Widget build(BuildContext context) => Obx(() => Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(74.w),
        child: AppBar(
          toolbarHeight: 84,
          backgroundColor: ColorPath.PrimaryLightColor,
          leadingWidth: 60,
          leading: Container(
            margin: const EdgeInsets.only(
              left: 20,
            ),
            child: CircleAvatar(
              backgroundColor: ColorPath.BackgroundWhite,
              radius: 24,
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
            onTitle(),
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: onPageView(),
        ),
      )));

  String onTitle() {
    switch (controller.medicine_name.value) {
      case 'dopamine':
        return '도파민제';

      default:
        return '페이지 없음';
    }
  }

  Widget onPageView() {
    switch (controller.medicine_name.value) {
      case 'dopamine':
        return const MedicineInfoDopaminePage();

      default:
        return Container();
    }
  }
}
