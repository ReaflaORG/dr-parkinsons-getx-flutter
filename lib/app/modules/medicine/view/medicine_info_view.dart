import 'package:base/app/modules/medicine/page/medicine_info_complex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/medicine_info_controller.dart';
import '../page/medicine_info_comt_inhibitor.dart';
import '../page/medicine_info_dopamine.dart';
import '../page/medicine_info_dopamine_agonist.dart';
import '../page/medicine_info_etc.dart';
import '../page/medicine_info_maob_inhibitor.dart';

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
            controller.medicine_name.value,
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

  Widget onPageView() {
    switch (controller.medicine_name.value) {
      case '도파민제':
        return const MedicineInfoDopaminePage();
      case '복합제':
        return const MedicineInfoComplexPage();
      case '도파민 작용제':
        return const MedicineInfoDopamineAgonistPage();
      case '콤트 억제제':
        return const MedicineInfoComptInhibitorPage();
      case '마오비 억제제':
        return const MedicineInfoMaobInhibitorPage();
      case '기타약제':
        return const MedicineInfoEtcPage();

      default:
        return Container();
    }
  }
}
