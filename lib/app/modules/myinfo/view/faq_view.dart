import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/faq_controller.dart';

// faq view
class FaqView extends GetView<FaqController> {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '자주 묻는 질문',
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50).w,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.faqData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ContentWidget(
                      index: index,
                    );
                  },
                ),
                SizedBox(height: 50.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 컨텐츠 위젯
class ContentWidget extends GetView<FaqController> {
  const ContentWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        title: Text(
          controller.faqData[index].question,
          style: TextPath.TextF14W500.copyWith(
            color: ColorPath.TextGrey1H212121,
          ),
        ),
        trailing: Image.asset(
          'assets/my_symptoms/expandable_lower_icon.png',
          width: 12,
          height: 6,
        ),
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(18.w, 16.w, 18.w, 16.w),
                decoration: BoxDecoration(
                  color: ColorPath.Background1HECEFF1,
                ),
                child: Text(
                  controller.faqData[index].answer,
                  style: const TextStyle(
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
