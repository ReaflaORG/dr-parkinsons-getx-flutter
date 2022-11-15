import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/medicine_info_controller.dart';
import '../widget/medicine_info.dart';

class MedicineInfoView extends GetView<MedicineInfoController> {
  const MedicineInfoView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
            '도파민제',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              MedicineInfo(),
            ],
          ),
        ),
      ));
}
