import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/healthcare__controller.dart';
import '../widgets/healthcare_mainbtn.dart';

class HealthCareView extends GetView<HealthCareController> {
  const HealthCareView({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPath.BackgroundWhite,
            elevation: 0,
            centerTitle: false,
            title: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                '건강관리',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('hey'),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            mainAxisSpacing: 20.w,
                            crossAxisSpacing: 20.w,
                            children: [
                              HealthcareMainbtn(
                                  name: "약물검색",
                                  color: ColorPath.PrimaryLightColor,
                                  icon: 'assets/images/icon/3d/48 pill.png',
                                  onClick: () {
                                    print('123');
                                  }),
                              HealthcareMainbtn(
                                  name: "주의해야할 약",
                                  color: ColorPath.TertiaryLightColor,
                                  icon: 'assets/images/icon/3d/48 pill.png',
                                  onClick: () {
                                    print('121');
                                    // Get.toNamed(page)
                                  }),
                              HealthcareMainbtn(
                                  name: "약물검색",
                                  color: ColorPath.SecondaryLightColor,
                                  icon: 'assets/images/icon/3d/48 pill.png',
                                  onClick: () {
                                    print('123');
                                  }),
                              HealthcareMainbtn(
                                  name: "주의해야할 약",
                                  color: ColorPath.SecondaryLightColor,
                                  icon: 'assets/images/icon/3d/48 pill.png',
                                  onClick: () {
                                    print('121');
                                    // Get.toNamed(page)
                                  }),
                              HealthcareMainbtn(
                                  name: "약물검색",
                                  color: ColorPath.SecondaryLightColor,
                                  icon: 'assets/images/icon/3d/48 pill.png',
                                  onClick: () {
                                    print('123');
                                  }),
                              HealthcareMainbtn(
                                  name: "주의해야할 약",
                                  color: ColorPath.TertiaryLightColor,
                                  icon: 'assets/images/icon/3d/48 pill.png',
                                  onClick: () {
                                    print('121');
                                    // Get.toNamed(page)
                                  }),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

// // elevation: 0,
//             // shadowColor: Colors.white,
//             title: Text(
//               '건강관리',
//               // style: TextPath.Heading2F18W600.copyWith(
//                 // color: ColorPath.TextGrey1H212121,
//               ),
