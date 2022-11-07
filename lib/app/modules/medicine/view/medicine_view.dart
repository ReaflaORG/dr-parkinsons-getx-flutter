import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/medicine__controller.dart';
import '../widget/medicine_btn.dart';

class MedicineView extends GetView<MedicineController> {
  const MedicineView({super.key});

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
            '파킨슨 약물검색',
            style: TextPath.Heading2F18W600.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    mainAxisSpacing: 20.w,
                    crossAxisSpacing: 20.w,
                    children: List.generate(
                      controller.pillBtns.length,
                      (index) => MedicineBtn(
                        item: controller.pillBtns[index],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
