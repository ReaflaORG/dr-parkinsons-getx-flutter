import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/healthcare_controller.dart';
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
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Text(
                '건강관리',
                style: TextPath.Heading2F18W600.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: 24.w,
                  height: 24.h,
                  child: Image.asset(
                    'assets/images/icons/2d/24alert.png',
                  ),
                ),
              ),
              const SizedBox(width: 20),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 320.w,
                            height: 36.h,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: ColorPath.Background1HECEFF1,
                              borderRadius: BorderRadius.circular(36),
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 18.w,
                                    height: 18.w,
                                    child: Image.asset(
                                        'assets/images/icons/2d/18loud.png'),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    '[복지] 노인장기요양보험 안내',
                                    style: TextPath.TextF13W400.copyWith(
                                      color: ColorPath.TextGrey3H616161,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: 2,
                                  childAspectRatio: 1,
                                  mainAxisSpacing: 20.w,
                                  crossAxisSpacing: 20.w,
                                  children: List.generate(
                                    controller.btns.length,
                                    (index) => HealthcareMainbtn(
                                        item: controller.btns[index]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.w,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: ColorPath.Background1HECEFF1,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 340,
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '복지혜택 보기',
                              style: TextPath.Heading2F18W600.copyWith(
                                color: ColorPath.TextGrey1H212121,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '더보기',
                                    style: TextPath.TextF13W400.copyWith(
                                        color: ColorPath.TextGrey3H616161),
                                  ),
                                  Image.asset(
                                      width: 24.w,
                                      height: 24.w,
                                      'assets/images/icons/2d/24arrowright.png')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(
                            left: 16,
                            bottom: 8,
                          ),
                          width: 320.w,
                          height: 130.w,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/images/samples/sample1.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: ColorPath.SecondaryLightColor,
                                padding: const EdgeInsets.fromLTRB(4, 2, 4, 0),
                                child: Text(
                                  '22.10.23',
                                  style: TextPath.TextF13W500.copyWith(
                                      color: ColorPath.TextGrey3H616161),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.fromLTRB(6, 6, 6, 4),
                                color:
                                    ColorPath.SecondaryColor.withOpacity(0.8),
                                child: Text(
                                  '노인 장기요양보험 제도',
                                  style: TextPath.Heading3F16W600.copyWith(
                                    color: ColorPath.BackgroundWhite,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
