import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/faq_controller.dart';
import '../widgets/faq_item_widget.dart';

// faq view
class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPath.BackgroundWhite,
          elevation: 0,
          centerTitle: false,
          leadingWidth: 39.w,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 18.w),
              child: Image.asset(
                'assets/doctor/back_arrow.png',
                width: 21.w,
                height: 13.5.w,
              ),
            ),
          ),
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Text(
              '자주 묻는 질문',
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.fromLTRB(0.w, 10.w, 18.w, 10.w),
              child: InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'assets/search_doctors/search_doctors_icon.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 14.w),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.faqData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FaqItemWidget(
                      item: controller.faqData[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
