import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/medicine_info_controller.dart';

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
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '섹션 관련 이름',
                  textAlign: TextAlign.left,
                  style: TextPath.TextF14W400.copyWith(
                      color: ColorPath.TextGrey3H616161),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '약품에 대한 정보를 입력합니다.',
                  style: TextPath.TextF14W500.copyWith(
                      color: ColorPath.TextGrey1H212121),
                ),
              ),
            ],
          ),
        ),
      ));
}
