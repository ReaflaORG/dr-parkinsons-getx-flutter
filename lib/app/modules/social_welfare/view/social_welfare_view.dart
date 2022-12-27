import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../globals/global_loader_indicator_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/social_welfare_controller.dart';

/// 사회복지제도 리스트 페이지
class SocialWelfareView extends GetView<SocialWelfareController> {
  const SocialWelfareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoad.value
          ? const GlobalLoaderIndicatorWidget()
          : Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
                elevation: 0,
                shadowColor: Colors.white,
                title: Text(
                  '파킨슨 사회복지제도',
                  style: TextPath.Heading2F18W600.copyWith(
                    color: ColorPath.TextGrey1H212121,
                  ),
                ),
                backgroundColor: Colors.white,
              ),
              floatingActionButton: SizedBox(
                width: 110.w,
                height: 30.w,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorPath.PrimaryDarkColor,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(30).r,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Text(
                      '+ 정책제안',
                      style: TextPath.TextF14W500.copyWith(
                        color: ColorPath.BackgroundWhite,
                      ),
                    ),
                  ),
                  // backgroundColor: ColorPath.PrimaryDarkColor,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.w, bottom: 50.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        controller.welfareDatas.length,
                        (index) {
                          return SocialWelfareCardWidget(
                            index: index,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

/// 사회복지제도 카드 위젯
class SocialWelfareCardWidget extends GetView<SocialWelfareController> {
  const SocialWelfareCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Get.toNamed(
              '/socialwelfare/socialwelfarepost',
              arguments: {
                'id': controller.welfareDatas[index].welfare_id,
              },
            );
          },
          child: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(
              left: 16,
              bottom: 8,
            ),
            width: 320.w,
            height: 130.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  controller.welfareDatas[index].image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16).r,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 4,
                //   ),
                //   decoration: BoxDecoration(
                //     color: ColorPath.SecondaryColor.withOpacity(
                //       0.7,
                //     ),
                //     borderRadius: BorderRadius.circular(4).r,
                //   ),
                //   child: Text(
                //     DateFormat('yyyy-MM-dd').format(
                //       controller.welfareDatas[index].created_at,
                //     ),
                //     style: TextPath.TextF13W500.copyWith(
                //       color: ColorPath.TextWhite,
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: ColorPath.PrimaryColor.withOpacity(
                      0.8,
                    ),
                    borderRadius: BorderRadius.circular(4).r,
                  ),
                  child: Text(
                    controller.welfareDatas[index].title,
                    style: TextPath.Heading3F16W600.copyWith(
                      color: ColorPath.TextWhite,
                    ),
                  ),
                ),
                SizedBox(height: 5.w),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.w),
      ],
    );
  }
}
