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
        body: controller.isLoad.value
            ? const GlobalLoaderIndicatorWidget()
            : Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ).w,
                child: GridView.builder(
                  controller: controller.scrollController.value,
                  itemCount: controller.factData.length,
                  scrollDirection: Axis.vertical,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // childAspectRatio: 1 / 1.35, // 가로 / 세로 비율
                    childAspectRatio:
                        Get.width / (Get.height / 1.8), // 가로 / 세로 비율
                    mainAxisSpacing: 20.w,
                    crossAxisSpacing: 20.w,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CardWidget(
                      index: index,
                      onTap: () {
                        Get.toNamed(
                          '/fact/factpost/${controller.factData[index].idx}',
                          arguments: {
                            'id': controller.factData[index].idx,
                            'image': controller.factData[index].image,
                          },
                        );
                      },
                    );
                  },
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
    required this.onTap,
  });

  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GlobalInkWellWidget(
      borderRadius: 8.r,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8).r,
            child: SizedBox(
              height: 125.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: controller.factData[index].idx,
                    child: Image.network(
                      controller.factData[index].image,
                      cacheWidth: 300,
                      // cacheHeight: 300,
                      fit: BoxFit.cover,
                      // filterQuality: FilterQuality.medium,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorPath.PrimaryColor.withOpacity(0.1),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Icon(
                      Icons.article_rounded,
                      size: 20.w,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.w),
          Text(
            controller.factData[index].title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            softWrap: false,
            style: TextPath.TextF14W600.copyWith(
              color: ColorPath.BlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
