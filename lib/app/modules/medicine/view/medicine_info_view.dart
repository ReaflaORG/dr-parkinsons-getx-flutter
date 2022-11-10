import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/medicine_info_controller.dart';
import '../widget/medicine_info.dart';

class MedicineInfoView extends GetView<MedicineInfoController> {
  const MedicineInfoView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        shadowColor: Colors.white,
        title: Text(
          '약품정보',
          style: TextPath.Heading2F18W600.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
