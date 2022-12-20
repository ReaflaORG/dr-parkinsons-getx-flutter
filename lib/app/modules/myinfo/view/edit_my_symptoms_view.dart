import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';

import '../../../theme/colors.dart';
import '../../../theme/texts.dart';
import '../controller/edit_my_symptoms_controller.dart';

const String alertTitleMsg = '내 증상 기록 수정';
const String alertContentMsg = '내 증상 기록이 수정되었습니다.';

// edit my symptoms view
class EditMySymptomsView extends GetView<EditMySymptomsController> {
  const EditMySymptomsView({super.key});

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
              ;
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
              '내 증상 편집',
              style: TextPath.Heading2F18W600.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        body: !controller.process.value
            ? GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        const EditMySymptomsBodyView(),
                        SizedBox(height: MediaQuery.of(context).padding.bottom),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

// edit my symptoms view - call item widget
class EditMySymptomsBodyView extends GetView<EditMySymptomsController> {
  const EditMySymptomsBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const EditMySymptomsForm(),
          SizedBox(height: 50.w),
          const EditMySymptomsAction(),
          SizedBox(height: 30.w),
        ],
      ),
    );
  }
}

class EditMySymptomsForm extends GetView<EditMySymptomsController> {
  const EditMySymptomsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.fromLTRB(20.w, 0.w, 20.w, 0.w),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '제목',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              controller: controller.titleController.value,
              focusNode: controller.titleFoucesNode.value,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '파킨슨 일지 (10.17)',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.w,
                  horizontal: 8.w,
                ),
              ),
            ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '내 증상 기록',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 6.w),
            TextField(
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              controller: controller.contentController.value,
              focusNode: controller.contentFoucesNode.value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.GrayCCCColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorPath.Gray333Color),
                ),
                hintText: '내용입력',
                hintStyle: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey4H9E9E9E,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14.w,
                  horizontal: 8.w,
                ),
              ),
            ),
            SizedBox(height: 24.w),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '영상 및 사진 업로드',
                style: TextPath.TextF14W500.copyWith(
                  color: ColorPath.TextGrey1H212121,
                ),
              ),
            ),
            SizedBox(height: 12.w),
            SizedBox(height: 12.w),
            GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10.w,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10.w,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  // 추가 버튼
                  DottedBorder(
                    color: const Color.fromRGBO(4, 168, 180, 0.9),
                    strokeWidth: 1,
                    dashPattern: const [3, 1],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(6.w),
                    child: TextButton(
                      onPressed: () async {
                        await controller.handleFileSelected();
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: ColorPath.TextGrey1H212121,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          '+',
                          style: TextPath.TextF20W400.copyWith(
                            color: const Color.fromRGBO(4, 168, 180, 0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  ...List.generate(
                      controller.editItem.value.symptomHistoryFiles.length,
                      (index) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: CachedNetworkImageProvider(controller.editItem
                                    .value.symptomHistoryFiles[index].type ==
                                'image'
                            ? controller
                                .editItem.value.symptomHistoryFiles[index].url
                            : controller.editItem.value
                                .symptomHistoryFiles[index].thumbnail!),
                        fit: BoxFit.cover,
                      )),
                      padding: EdgeInsets.all(5.w),
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          controller.handleContentRemove(index: index);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.cancel_rounded,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  // 추가된 파일
                  ...List.generate(controller.files.length, (index) {
                    String mimeStr =
                        lookupMimeType(controller.files[index].path)!
                            .split('/')[0];

                    return mimeStr == 'image'
                        ? Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: FileImage(
                                File(controller.files[index].path),
                              ),
                              fit: BoxFit.cover,
                            )),
                            padding: EdgeInsets.all(5.w),
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                controller.handleFileRemove(index: index);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 5.w),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.cancel_rounded,
                                ),
                              ),
                            ),
                          )
                        : Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                color: Colors.black,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(7.w),
                                child: Image.asset(
                                    'assets/doctor/video_play_button.png'),
                              ),
                              Positioned(
                                top: 5.w,
                                right: 3.w,
                                child: GestureDetector(
                                  onTap: () {
                                    controller.handleFileRemove(index: index);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 5.w),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.cancel_rounded,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                  }).toList(),
                ]),
          ],
        ),
      ),
    );
  }
}

class EditMySymptomsAction extends GetView<EditMySymptomsController> {
  const EditMySymptomsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10.w, 0.w, 0.w, 0.w),
      child: Row(
        children: [
          SizedBox(
            width: 128,
            height: 38,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              style: TextButton.styleFrom(
                foregroundColor: ColorPath.TextGrey1H212121,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                  side: BorderSide(
                    color: ColorPath.Border3E7E7E7,
                  ),
                ),
              ),
              child: Text(
                '취소',
                style: TextPath.TextF14W400.copyWith(
                  color: ColorPath.TextGrey3H616161,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: SizedBox(
              height: 38,
              child: TextButton(
                onPressed: () {
                  controller.handleSubmit(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: ColorPath.TextGrey1H212121,
                  backgroundColor: ColorPath.PrimaryDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: ColorPath.Border3E7E7E7,
                    ),
                  ),
                ),
                child: Text(
                  '완료',
                  style: TextPath.TextF14W400.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
