import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/drugmisuse_controller.dart';
import '../widgets/drugmisuse_infobox.dart';

class DrugMisuseView extends GetView<DrugMisuseController> {
  const DrugMisuseView({super.key});

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
            '주의해야할 약 검색',
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
                ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                      controller.boxes.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: DrugMisuseInfoBox(
                          box: controller.boxes[index],
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    width: 320,
                    // height: 52,
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorPath.Background1HECEFF1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(6),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          width: 26,
                          child: Image.asset(
                              width: 18.w,
                              height: 18.w,
                              'assets/images/icons/2d/18checker.png'),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: 18.w,
                                    child: Text(
                                      '도마틸정',
                                      style: TextPath.TextF13W500,
                                    ),
                                  ),
                                  // const Spacer(),
                                  Text(
                                    '대우제약',
                                    style: TextPath.TextF12W400,
                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 20.w,
                                child: Text(
                                  '#위장약 #클로르프로마진',
                                  style: TextPath.TextF13W400,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
