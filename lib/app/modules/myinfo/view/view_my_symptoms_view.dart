import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_parkinsons/app/modules/myinfo/models/my_symptoms_item_model.dart';
import 'package:dr_parkinsons/app/utils/video/video_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/app_pages.dart';
import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../../../utils/image/photo_view.dart';
import '../controller/view_my_symtoms_controller.dart';

// view my symptoms view
class ViewMySymptomsView extends GetView<ViewMySymptomsController> {
  const ViewMySymptomsView({super.key});

  @override
  Widget build(BuildContext context) => Obx(() => !controller.process.value
      ? Scaffold(
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
                '내 증상 기록',
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
                  onTap: () async {
                    await Get.toNamed(
                      Routes.EDIT_MY_SYMPTOMS,
                      arguments: {'id': controller.item.value.symptomHistoryId},
                    );
                    await controller.getMySymptomsData();
                  },
                  child: Text(
                    '편집하기',
                    style: TextPath.TextF16W600.copyWith(
                      color: ColorPath.TextGrey1H212121,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40.w),
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
                  SizedBox(height: 20.w),
                  SymptomsKeyChildImageListWidget(
                    items: controller.item.value.symptomHistoryFiles
                        .where((element) => element.type == 'video')
                        .toList(),
                    type: 'video',
                    label: '영상',
                  ),
                  SizedBox(height: 20.w),
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
        )
      : const Scaffold(
          body: SafeArea(
              child: Center(
            child: CircularProgressIndicator(),
          )),
        ));
}

// 키 값 위젯
class SymptomsKeyValueWidget extends StatelessWidget {
  final String label;
  final String text;
  const SymptomsKeyValueWidget(
      {Key? key, required this.label, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextPath.Heading3F16W600.copyWith(
                color: ColorPath.TextGrey2H424242),
          ),
          SizedBox(height: 6.w),
          Text(
            text,
            style: TextPath.TextF14W400.copyWith(
                color: ColorPath.TextGrey2H424242),
          )
        ],
      ),
    );
  }
}

// 키 이미지 리스트 모델
class SymptomsKeyChildImageListWidget extends StatelessWidget {
  final String label;
  final String type;
  final List<SymptomHistoryFilesModel> items;
  const SymptomsKeyChildImageListWidget(
      {Key? key, required this.label, required this.items, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            label,
            style: TextPath.Heading3F16W600.copyWith(
                color: ColorPath.TextGrey2H424242),
          ),
        ),
        SizedBox(height: 6.w),
        SizedBox(
          height: 100.w,
          child: ListView.builder(
            itemCount: items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  if (type == 'video') {
                    Get.to(() => VideoView(content_url: items[index].url));
                  } else {
                    Get.to(() => PhotoPageView(
                          images: items.map((e) => e.url).toList(),
                          initIndex: index,
                        ));
                  }
                },
                child: Container(
                  width: 130.w,
                  height: 100.w,
                  margin:
                      EdgeInsets.only(right: 10.w, left: index == 0 ? 40.w : 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.w),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(type == 'image'
                          ? items[index].url
                          : items[index].thumbnail!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
