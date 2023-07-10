import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:video_player/video_player.dart';

import '../../../globals/global_appbar_widget.dart';
import '../../../globals/global_dialog_widget.dart';
import '../../../globals/global_inkwell_widget.dart';
import '../../../globals/global_layout_widget.dart';
import '../../../globals/global_text_widget.dart';
import '../../../theme/color_path.dart';
import '../../../theme/text_path.dart';
import '../controller/edit_my_symptoms_controller.dart';

// edit my symptoms view
class EditMySymptomsView extends GetView<EditMySymptomsController> {
  const EditMySymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GlobalLayoutWidget(
        context: context,
        resizeToAvoidBottomInset: true,
        appBar: GlobalAppBarWidget(
          appBar: AppBar(),
          title: '내 증상 수정하기',
          actions: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 5).w,
              child: TextButton(
                onPressed: controller.isSaveButtonEnable.value
                    ? () => controller.handleSubmit()
                    : null,
                child: Text(
                  '저장',
                  style: TextPath.TextF14W600.copyWith(
                    color: controller.isSaveButtonEnable.value
                        ? ColorPath.TextGrey1H212121
                        : const Color(0XFFDADADA),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: !controller.process.value
            ? SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 50).w,
                  child: Column(
                    children: [
                      const TextFieldWidget(),
                      SizedBox(height: 50.w),
                      // const WriteMySymptomsAction(),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

class TextFieldWidget extends GetView<EditMySymptomsController> {
  const TextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '제목',
            style: TextPath.TextF16W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            controller: controller.titleTextEditController.value,
            focusNode: controller.titleFoucesNode.value,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'title');
            },
            decoration: InputDecoration(
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPath.GrayCCCColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorPath.Gray333Color),
              ),
              hintText: '제목을 입력해주세요',
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.w,
                horizontal: 8.w,
              ),
            ),
          ),
          if (controller.titleError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5).w,
              child: GlobalTextWidget.error(
                controller.titleError.value,
              ),
            ),
          SizedBox(height: 32.w),
          Text(
            '내 증상 기록',
            style: TextPath.TextF16W500.copyWith(
              color: ColorPath.TextGrey1H212121,
            ),
          ),
          SizedBox(height: 5.w),
          TextField(
            maxLines: 10,
            keyboardType: TextInputType.multiline,
            controller: controller.contentTextEditController.value,
            focusNode: controller.contentFoucesNode.value,
            onChanged: (String value) {
              controller.handleOnChanged(value, type: 'content');
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPath.GrayCCCColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPath.Gray333Color),
              ),
              hintText: '나의 증상을 기록해보세요!',
              hintStyle: TextPath.TextF14W500.copyWith(
                color: ColorPath.TextGrey4H9E9E9E,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.w,
                horizontal: 8.w,
              ),
            ),
          ),
          if (controller.contentError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 5).w,
              child: GlobalTextWidget.error(
                controller.contentError.value,
              ),
            ),
          SizedBox(height: 32.w),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '영상 및 사진 업로드',
              style: TextPath.TextF16W500.copyWith(
                color: ColorPath.TextGrey1H212121,
              ),
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
              children: [
                GlobalInkWellWidget(
                  onTap: () {
                    GlobalAlbumBottomSheetModal(albumOnPressed: () {
                      controller.handleFileAdd(isImage: true);
                      Get.back();
                    }, videoOnPressed: () {
                      controller.handleFileAdd(isImage: false);
                      Get.back();
                    });
                  },
                  child: DottedBorder(
                    color: ColorPath.TextGrey4H9E9E9E,
                    strokeWidth: 1,
                    dashPattern: const [6, 1],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(6).w,
                    child: Center(
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.grey.shade300,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
                ...List.generate(
                    controller.editItem.value.symptomHistoryFiles.length,
                    (index) {
                  // return Stack(
                  //   children: [
                  //     ClipRRect(
                  //       borderRadius: BorderRadius.circular(6.w),
                  //       child: Image.network(
                  //         controller.editItem.value.symptomHistoryFiles[index]
                  //                     .type ==
                  //                 'image'
                  //             ? controller.editItem.value
                  //                 .symptomHistoryFiles[index].url
                  //             : controller.editItem.value
                  //                 .symptomHistoryFiles[index].thumbnail!,
                  //         fit: BoxFit.cover,
                  //         width: double.infinity,
                  //         height: double.infinity,
                  //       ),
                  //     ),
                  //     Positioned(
                  //       top: 5.w,
                  //       right: 5.w,
                  //       child: GestureDetector(
                  //         onTap: () {
                  //           controller.handleContentRemove(index: index);
                  //         },
                  //         child: const Icon(
                  //           Icons.close_rounded,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // );
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.w),
                        child: Image.network(
                          controller.editItem.value.symptomHistoryFiles[index]
                                      .type ==
                                  'image'
                              ? controller
                                  .editItem.value.symptomHistoryFiles[index].url
                              : controller.editItem.value
                                  .symptomHistoryFiles[index].thumbnail!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Positioned(
                        top: 5.w,
                        right: 5.w,
                        child: GestureDetector(
                          onTap: () {
                            controller.handleFileRemove(index: index);
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
                ...List.generate(controller.files.length, (index) {
                  String mimeStr = lookupMimeType(controller.files[index].path)!
                      .split('/')[0];

                  return mimeStr == 'image'
                      ? Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.w),
                              child: Image.file(
                                File(controller.files[index].path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            Positioned(
                              top: 5.w,
                              right: 5.w,
                              child: GestureDetector(
                                onTap: () {
                                  controller.handleFileRemove(index: index);
                                },
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.w),
                              child: VideoPlayer(
                                VideoPlayerController.network(
                                  controller.files[index].path,
                                )..initialize().then((_) {}),
                              ),
                            ),
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
                            Positioned(
                              top: 5.w,
                              right: 5.w,
                              child: GlobalInkWellWidget(
                                onTap: () {
                                  controller.handleFileRemove(index: index);
                                },
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        );
                }).toList(),
              ]),
        ],
      ),
    );
  }
}
