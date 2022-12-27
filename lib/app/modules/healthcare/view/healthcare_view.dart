import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../models/welfare_model.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/color_path.dart';
import '../../../theme/texts.dart';
import '../controller/healthcare_controller.dart';
import '../widgets/healthcare_mainbtn.dart';

class HealthCareView extends GetView<HealthCareController> {
  const HealthCareView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        appBar: GlobalAppBarWidget(
          title: '건강관리',
          appBar: AppBar(),
          isLeadingVisible: true,
          actions: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 24.w,
                height: 24.w,
                child: Image.asset(
                  'assets/images/icons/2d/24alert.png',
                ),
              ),
            ),
            SizedBox(width: 20.w),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).w,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 320.w,
                          height: 36.w,
                          decoration: BoxDecoration(
                            color: ColorPath.Background1HECEFF1,
                            borderRadius: BorderRadius.circular(36).r,
                          ),
                          child: GlobalInkWellWidget(
                            borderRadius: 36.r,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20).w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 18.w,
                                    height: 18.w,
                                    child: Image.asset(
                                      'assets/images/icons/2d/18loud.png',
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
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
                        ),
                        SizedBox(height: 18.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GridView.count(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10.w,
                              crossAxisSpacing: 10.w,
                              children: List.generate(controller.btns.length,
                                  (index) {
                                return HealthcareMainbtn(
                                  item: controller.btns[index],
                                );
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.w),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ).w,
                decoration: BoxDecoration(
                  color: ColorPath.Background1HECEFF1,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(30).r,
                    topRight: const Radius.circular(30).r,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 340.w,
                      padding: const EdgeInsets.only(bottom: 12).w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '복지혜택 보기',
                            style: TextPath.Heading2F18W600.copyWith(
                              color: ColorPath.TextGrey1H212121,
                            ),
                          ),
                          GlobalInkWellWidget(
                            padding: const EdgeInsets.only(left: 10).w,
                            onTap: () {
                              Get.toNamed(Routes.SOCIALWELFARE);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '더보기',
                                  style: TextPath.TextF13W400.copyWith(
                                    color: ColorPath.TextGrey3H616161,
                                  ),
                                ),
                                Image.asset(
                                  width: 24.w,
                                  height: 24.w,
                                  'assets/images/icons/2d/24arrowright.png',
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        controller.welfareLists.length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 20).w,
                            child: WelfareCardWidget(
                              item: controller.welfareLists[index],
                            ),
                          );
                        },
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
}

/// 복지 혜택 카드 위젯
class WelfareCardWidget extends StatelessWidget {
  final WelfareModel item;
  const WelfareCardWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: 320.w,
      height: 130.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          // 이미지 api로 처음받아봄
          image: CachedNetworkImageProvider(item.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: GlobalInkWellWidget(
        padding: const EdgeInsets.only(
          left: 16,
          bottom: 8,
        ).w,
        borderRadius: 8.r,
        onTap: () {
          Get.toNamed(
            Routes.SOCIALWELFARE + Routes.SOCIALWELFAREPOST,
            arguments: {
              'id': item.welfare_id,
            },
          );
        },
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: ColorPath.SecondaryLightColor,
                padding: const EdgeInsets.fromLTRB(4, 2, 4, 0).w,
                child: Text(
                  DateFormat('yy.MM.dd').format(item.created_at),
                  style: TextPath.TextF13W500.copyWith(
                    color: ColorPath.TextGrey3H616161,
                  ),
                ),
              ),
              SizedBox(height: 4.w),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 6, 6, 4).w,
                color: ColorPath.PrimaryColor.withOpacity(0.8),
                child: Text(
                  item.title,
                  style: TextPath.Heading3F16W600.copyWith(
                    color: ColorPath.BackgroundWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
