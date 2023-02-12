import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_parkinsons/app/globals/global_inkwell_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_loader_indicator_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../../../utils/image/photo_view.dart';
import '../../../utils/video/video_view.dart';
import '../controller/view_my_symtoms_controller.dart';
import '../models/my_symptoms_item_model.dart';

// view my symptoms view
class ViewMySymptomsView extends GetView<ViewMySymptomsController> {
  const ViewMySymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoad.value
          ? const GlobalLoaderIndicatorWidget()
          : GlobalLayoutWidget(
              context: context,
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
                    padding: const EdgeInsets.only(left: 18).w,
                    child: Image.asset(
                      'assets/doctor/back_arrow.png',
                      width: 21.w,
                      height: 13.5.w,
                    ),
                  ),
                ),
                title: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4).w,
                  child: Text(
                    '내 증상 기록',
                    style: TextPath.Heading2F18W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '삭제하기',
                        style: TextPath.TextF14W600.copyWith(
                          color: ColorPath.TextGrey1H212121,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10).w,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.EDIT_MY_SYMPTOMS,
                          arguments: {
                            'id': controller.item.value.symptomHistoryId
                          },
                        );
                        controller.getMySymptomsData();
                      },
                      child: Text(
                        '편집하기',
                        style: TextPath.TextF14W600.copyWith(
                          color: ColorPath.TextGrey1H212121,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SymptomsKeyValueWidget(
                        label: controller.item.value.title,
                        text: DateFormat('MM월 dd일 hh시 mm분')
                            .format(controller.item.value.createdAt),
                      ),
                      SizedBox(height: 20.w),
                      SymptomsKeyValueWidget(
                        label: '내 증상 기록',
                        text: controller.item.value.description,
                      ),
                      SizedBox(height: 40.w),
                      if (controller.item.value.symptomHistoryFiles
                          .where((element) => element.type == 'video')
                          .toList()
                          .isNotEmpty)
                        Column(
                          children: [
                            SymptomsKeyChildImageListWidget(
                              items: controller.item.value.symptomHistoryFiles
                                  .where((element) => element.type == 'video')
                                  .toList(),
                              type: 'video',
                              label: '영상',
                            ),
                            SizedBox(height: 20.w),
                          ],
                        ),
                      if (controller.item.value.symptomHistoryFiles
                          .where((element) => element.type == 'image')
                          .toList()
                          .isNotEmpty)
                        SymptomsKeyChildImageListWidget(
                          items: controller.item.value.symptomHistoryFiles
                              .where((element) => element.type == 'image')
                              .toList(),
                          type: 'image',
                          label: '사진',
                        ),
                      SizedBox(height: 6.w),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

// 키 값 위젯
class SymptomsKeyValueWidget extends StatelessWidget {
  const SymptomsKeyValueWidget({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextPath.Heading3F16W600.copyWith(
            color: ColorPath.TextGrey2H424242,
          ),
        ),
        SizedBox(height: 5.w),
        Text(
          text,
          style: TextPath.TextF14W400.copyWith(
            color: ColorPath.TextGrey2H424242,
          ),
        )
      ],
    );
  }
}

// 키 이미지 리스트 모델
class SymptomsKeyChildImageListWidget extends StatelessWidget {
  const SymptomsKeyChildImageListWidget({
    super.key,
    required this.label,
    required this.items,
    required this.type,
  });

  final String label;
  final String type;
  final List<SymptomHistoryFilesModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextPath.Heading3F16W600.copyWith(
            color: ColorPath.TextGrey2H424242,
          ),
        ),
        SizedBox(height: 20.w),
        GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 2 / 2,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.w,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: List.generate(
            items.length,
            (index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(6.w),
                child: GlobalInkWellWidget(
                  onTap: () {
                    if (type == 'video') {
                      Get.to(() => VideoView(content_url: items[index].url));
                    } else {
                      Get.to(
                        () => PhotoPageView(
                          images: items.map((e) => e.url).toList(),
                          initIndex: index,
                        ),
                      );
                    }
                  },
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: type == 'image'
                            ? items[index].url
                            : items[index].thumbnail!,
                        width: 110.w,
                        height: 110.w,
                        fit: BoxFit.cover,
                      ),
                      if (type == 'video')
                        Positioned.fill(
                          child: Center(
                            child: SizedBox(
                              width: 30.w,
                              child: Image.asset(
                                'assets/doctor/video_play_button.png',
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // SizedBox(
        //   height: 100.w,
        //   child: ListView.builder(
        //     itemCount: items.length,
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (BuildContext context, int index) {
        //       return
        //     },
        //   ),
        // ),
      ],
    );
  }
}
