import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_loader_indicator_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/fact_controller.dart';

class FactView extends GetView<FactController> {
  const FactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '파킨슨병 완전정복',
          elevation: controller.isScrollCheck.value ? 1 : 0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: ColorPath.PrimaryDarkColor,
          splashColor: ColorPath.PrimaryColor,
          onPressed: () {
            Get.toNamed('/myinfo/suggest_policy');
          },
          icon: const Icon(Icons.add_rounded),
          label: Text(
            '정책제안',
            style: TextPath.TextF14W500.copyWith(
              color: ColorPath.TextWhite,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: controller.isLoad.value
            ? const GlobalLoaderIndicatorWidget()
            : SingleChildScrollView(
                controller: controller.scrollController.value,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.w, bottom: 50.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      controller.factData.length,
                      (index) {
                        return CardWidget(
                          index: index,
                        );
                      },
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

/// 카드 위젯
class CardWidget extends GetView<FactController> {
  const CardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalInkWellWidget(
          borderRadius: 8.r,
          onTap: () {
            Get.toNamed(
              '/fact/factpost/${controller.factData[index].idx}',
              arguments: {
                'id': controller.factData[index].idx,
                'image': controller.factData[index].image,
              },
            );
          },
          child: Hero(
            tag: controller.factData[index].idx,
            child: Container(
              alignment: Alignment.bottomLeft,
              height: 130.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    controller.factData[index].image,
                    scale: 0.5,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8).r,
              ),
              child: Container(
                margin: const EdgeInsets.all(10).w,
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 2,
                ).w,
                decoration: BoxDecoration(
                  color: ColorPath.PrimaryColor.withOpacity(
                    0.8,
                  ),
                  borderRadius: BorderRadius.circular(4).r,
                ),
                child: Text(
                  controller.factData[index].title,
                  style: TextPath.Heading3F16W600.copyWith(
                    color: ColorPath.TextWhite,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.w),
      ],
    );
  }
}
